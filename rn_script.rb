#!/usr/bin/env ruby
require "json"
require "fileutils"


# 1. 获取当前git tags  是否包含package RN version 
# 包含则删除本地tag 删除远端tags 提交新的代码并更新RN tags 
# 2. 处理本地RNpaakage 删除 node_modules 重新 执行npm install 
# 3. 获取RN代码仓库地址
# 4. 处理podspec 
# 5. 提交代码并提交tag 
# 6. 生成相应路径到私有库



def git_source
  com = `git remote show origin`
  return com.scan(/Push  URL:.*/)[0].delete_prefix("Push  URL: ")
end

def git_config
  package = JSON.parse(File.read("package.json"))
  tag =  package["dependencies"]["react-native"].delete_prefix("v")
  pattern = Regexp.new(tag)
  
  com = `git tag --list`
  if com.scan(pattern).empty?
    return
  end
  # TOTO 删除本地tags 删除远端tags 
  remove_tag =  `git tag -d #{tag} && git push origin :refs/tags/#{tag}`
  initEVN = `rm -rf node_modules podscpe  && yarn add react-native@#{tag}`
end


def rn_private_libraries(params)
  git_config
  target_dir = params[0] 
  target_dir = "podspec" if params.empty?
  source = git_source

  Dir.glob('**/*.podspec').each do |podspec_file|
    fileName = File.basename(podspec_file, ".*")
    
    podspec_recompose_yoga(podspec_file, source)  if fileName == 'Yoga'
    podspec_recompose_golog(podspec_file) if fileName == 'glog'

    next if fileName == 'Folly' || fileName == 'DoubleConversion' || fileName == 'glog' || fileName == 'Yoga'
    podspec_recompose(podspec_file, source)
  end  

  git_push()
  create_podspec(target_dir)
end


def create_podspec(target_dir)
  Dir.glob('**/*.podspec').each do |podspec_file|
    fileName = File.basename(podspec_file, ".*")
    package = JSON.parse(File.read("package.json"))
    tag =  package["dependencies"]["react-native"].delete_prefix("v")

    tag = get_version(podspec_file) if fileName == 'Folly' || fileName == 'glog' || fileName == 'DoubleConversion'

    target_file = "#{target_dir}/#{fileName}/#{tag}/#{File.basename(podspec_file)}"

    if target_file == podspec_file then return end 
  
    FileUtils.mkdir_p(File.dirname(target_file)) unless File.exist?(File.dirname(target_file))
    FileUtils.remove_file(target_file, force = false) if File.file?(target_file)
    FileUtils.cp(podspec_file, target_file)
  end
  copy_shell(target_dir)

end

def get_version(podspec_file)
  return File.read(podspec_file).scan(/spec\.version \= .*/)[0].delete_prefix("spec\.version \= '").delete_suffix("'")
end

def copy_shell(file_dir)

  package = JSON.parse(File.read("package.json"))
  version = package["dependencies"]["react-native"].delete_prefix("v")

  file_dir = "#{file_dir}/#{version}/scripts/"
  FileUtils.mkdir_p(file_dir) unless File.exist?(file_dir)

  Dir.glob('**/*.sh').each do |shell_file|
    fileName = File.basename(shell_file, ".*")
    target_file = "#{file_dir}/#{File.basename(shell_file)}"

    FileUtils.remove_file(target_file, force = false) if File.file?(target_file)
    FileUtils.cp(shell_file, target_file)
  end
end

def git_push

  package = JSON.parse(File.read("package.json"))
  version =  package["dependencies"]["react-native"].delete_prefix("v")

  git_add = `git add .`
  puts git_add
  git_commit = `git commit -m "私有库初始化"`
  puts git_commit
  git_push_origin = `git push origin master`  
  puts git_push_origin
  git_tag = `git tag -a #{version} -m #{version}`
  puts git_tag
  git_push_tags = `git push --tags`
  puts git_push_tags

end

# 其他文件处理
def podspec_recompose(filePaht, git_source)

  podspec_dir = File.dirname(filePaht)
  podspec_file = File.read(filePaht)

  package = JSON.parse(File.read("package.json"))
  tags = package["dependencies"]["react-native"].delete_prefix("v")
  if tags.empty?
     return 
  end

  pattern = /\"([^\"]*[\.h,\},\*])\"/
  replace = podspec_file.gsub pattern do |item|
      item == '"v#{version}"'? item : "\"#{podspec_dir}/#{item.delete_suffix("\"").delete_prefix("\"")}\""
  end
  
  pattern = /\'([^\']*[\.h,\},\*])\'/
  replace = replace.gsub pattern do |item|
      "'#{podspec_dir}/#{item.delete_suffix("'").delete_prefix("'")}'"
  end

  pattern = /^version.*/
  replace = replace.gsub pattern do |version|
      "version = '#{tags}'"
  end

  pattern = /package\["version"\]/
  replace = replace.gsub pattern do |version|
    "'#{tags}'"
  end
  pattern = /package\['version'\]/
  replace = replace.gsub pattern do |version|
    "'#{tags}'"
  end

  pattern = /^source.*/
  replace = replace.gsub pattern do |source|
      "source = { :git => '#{git_source}' }"
  end

  pattern = /s\.source .*/
  replace = replace.gsub pattern do |source|
    "s.source       = { :git => \"#{git_source}\", :tag => '#{tags}' }"
  end
  
  pattern = /s\.summary  .*/
  replace = replace.gsub pattern do |source|
    "s.summary        = 'summary'"
  end

  pattern = /s\.license .*/
  replace = replace.gsub pattern do |source|
    "s.license        = 'MIT'"
  end

  pattern = /s\.author .*/
  replace = replace.gsub pattern do |source|
    "s.author         = 'author'"
  end

  pattern = /s\.homepage .*/
  replace = replace.gsub pattern do |source|
    "s.homepage       = '#{git_source}'"
  end

  pattern = /^package.*/
  replace = replace.gsub pattern do |package|
    ""
  end

  pattern = /package\[.*/
  replace = replace.gsub pattern do |package|
    ""
  end
  
  File.open(filePaht, 'w') do |out|
      out << replace
  end
end

# yoga 文件处理
def podspec_recompose_yoga(filePaht, git_source)
  podspec_dir = File.dirname(filePaht)
  podspec_file = File.read(filePaht)

  package = JSON.parse(File.read("package.json"))
  tags = package["dependencies"]["react-native"].delete_prefix("v")

  pattern = /spec\.version .*/
  replace = podspec_file.gsub pattern do |item|
    "spec.version = '#{tags}'"
  end

  pattern = /source_files .*/
  replace = replace.gsub pattern do |source|
    "source_files = '#{podspec_dir}/yoga/**/*.{cpp,h}'"
  end

  pattern = /header_files .*/
  replace = replace.gsub pattern do |source|
    "header_files = '#{podspec_dir}/yoga/{Yoga,YGEnums,YGMacros,YGValue}.h'"
  end

  pattern = /^source.*/
  replace = replace.gsub pattern do |source|
      "source = { :git => '#{git_source}' }"
  end

  pattern = /package .*/
  replace = replace.gsub pattern do |package|
    ""
  end

  pattern = /package\[.*/
  replace = replace.gsub pattern do |package|
    '""'
  end

  File.open(filePaht, 'w') do |out|
    out << replace
  end
end

# glog文件处理
def podspec_recompose_golog(filePaht)

  package = JSON.parse(File.read("package.json"))
  version = package["dependencies"]["react-native"].delete_prefix("v")

  pattern = /spec\.prepare_command.*/
  replace = File.read(filePaht).gsub pattern do |item|
    "spec.prepare_command = File.read(\"../../#{version}/scripts/ios-configure-glog.sh\")"
  end

  File.open(filePaht, 'w') do |out|
    out << replace
  end
end

rn_private_libraries(ARGV)