# RN打造私有库

以下第一节是我整个制作过程的一些疑问和整个思考。不想看可以直接跳到下面实操。实操也不想的可以直接看下面脚本拿去直接用就好了。

## 一、RN私有库的本质&思考

cocoapods 本质是中心化管理包管理工具。所有的podspec 文件都放在一个[cocopoad-specs](https://github.com/CocoaPods/Specs)的仓库中，而你需要发布的共有库在这里都会保存一个json的文件。而实际的源码文件是放在另外一个单独的仓库中。 这个仓库可以是一个仓库有多个podspec 也可以是一个仓库一个podspec。在本质上是没有什么区别的。一个仓库文件比较多的话 验证的过程和下载的过程就比较近久。


RN 在脚手架创建项目的时候是把很多的package文件依赖的包 下载到本地从而生成一个`node_modules` 的文件和`pods`本质没有什么区别。

那么了解了这些 就比较尴尬了 我们所以来的文件都在 `node_modules` 这里面的文件又是通过本地加载的。RN的每个版本差异都很大。很多都是不能服用的。那么我们只能是以来官方的脚本来把`node_modules`里面的包加载到本地的项目中去。 这样岂不是很难受。每次更新依赖都要先下载一遍nodejs的依赖。这不能提升效率和开发解偶。

这里主要解决的问题就是把`node_modules`里面存储的pods 需要的依赖打包成私有库 这样我们就可以只维护podfile 文件就可以了。这不是很美好。 目的已经清晰了。开始做这件事。

1. 创建私有specs 用来上报私有库的podspec 文件
2. 创建源码仓库用来保存私有库存放的源文件。（这里是放一个仓库还是多个仓库看个人喜好。我这里使用的是一个仓库容易维护，虽然每次下载依赖慢点，在内网千兆的速度也没有很慢。）
3. 这里就剩下一个问题了podspec 这个文件的维护。当然一个一个修改也是可以的。不过这个体力活（这里我写了一个[脚本](https://www.baidu.com)。）
4. 把修改好的podspec 文件全都拷贝一份到specs 这个文件夹里面。每个文件都添加`React/0.63.4/React.podspec`这样的路径保存下来。
5. 把源码仓库提交到远端。提交tag版本号和`React/0.63.4/React.podspec` 中间路径的tag保持一致。
6. 把私有库源`specs`私有库提交到远端。所有准备工作已经执行完成。
7. 最后在项目`podfile`文件中添加依赖`pod 'React', '~> 0.63.4'` 然后执行`pod install`整个工作就完成了。 

### 疑问解答

* 为什么不执行`pod repo push`?

因为有很多podspce文件不规范并不能通过cocoapods的验证 。还有一个就是依赖太繁琐了很多依赖顺序先执行那个后执行那个也很难处理。这里需要解析依赖。事情又复杂了。还有一个问题就是这些代码都是经过验证过的我们也并没有修改代码。只是把依赖文件修改了并上传。所以不用担心代码修改BUG的问题。

* 为什么有些文件找不到？

这里可能需要针对特殊的情况去处理。可能生成脚本代码的问题也可能是某个RN版本的问题。这时候看情况查看依赖的文件和源码文件有哪些不同针对性的修改podspec文件。然后直接提交就好了

这里也说明一点就是 源码文件里面的podspec 文件修改和不修改都是没有影响的。


##二、实操部分

1. 创建两个git仓库。如果已经有四有specs的话可以服用。并不用重复创建这里只需要创建一个源码仓库即可复制`package.json`到文件夹内

```shell
mkdir ReactNativePodPrivateLibraries 
cd ReactNativePodPrivateLibraries 
git init
mv ../../RNDemo/package.json .
```

2. 一下是我的`package.json`文件的内容。

```json
{
  "name": "mall",
  "version": "1.10.0",
  "minAppVersion": "",
  "private": true,
  "scripts": {
    "android": "react-native run-android",
    "ios": "react-native run-ios",
    "start": "react-native start",
    "test": "jest",
    "lint": "eslint .",
    "clean": "react-native-clean-project",
    "bundle:android": "react-native bundle --entry-file index.js --platform android --dev false --bundle-output dist/index.android.bundle",
    "bundle:ios": "react-native bundle --entry-file index.js --platform ios --dev false --bundle-output dist/index.jsbundle",
    "bundle": "better-npm-run bundle",
    "bundle:stage": "better-npm-run bundle:stage",
    "bundle:prod": "better-npm-run bundle:prod"
  },
  "betterScripts": {
    "bundle": {
      "command": "node build/bundle.js",
      "env": {
        "NODE_ENV": "dev"
      }
    },
    "bundle:stage": {
      "command": "node build/bundle.js",
      "env": {
        "NODE_ENV": "stage"
      }
    },
    "bundle:prod": {
      "command": "node build/bundle.js",
      "env": {
        "NODE_ENV": "prod"
      }
    }
  },
  "dependencies": {
    "@react-native-community/slider": "^3.0.3",
    "@react-navigation/compat": "^5.3.15",
    "@sentry/react-native": "^2.4.2",
    "crypto-js": "^4.0.0",
    "events": "^3.3.0",
    "mobx": "^6.1.8",
    "mobx-react": "^7.1.0",
    "react": "^16.14.0",
    "react-native": "0.63.4",
    "react-native-axios": "^0.17.1",
    "react-native-gesture-handler": "^1.10.3",
    "react-native-image-base64": "^0.1.4",
    "react-native-linear-gradient": "^2.5.6",
    "react-native-reanimated": "^1.13.2",
    "react-native-safe-area-context": "^3.1.9",
    "react-native-screens": "^2.18.0",
    "react-native-share": "^5.1.6",
    "react-native-splash-screen": "^3.2.0",
    "react-native-status-bar-height": "^2.6.0",
    "react-native-storage": "^1.0.1",
    "react-native-swiper": "^1.6.0",
    "rnbridge-link": "^1.0.0",
    "zarm": "^2.8.1"
  },
  "devDependencies": {
    "@babel/core": "^7.12.10",
    "@babel/helper-module-transforms": "^7.13.0",
    "@babel/plugin-proposal-decorators": "^7.12.1",
    "@babel/runtime": "^7.12.5",
    "@react-native-community/eslint-config": "^2.0.0",
    "@react-native-community/masked-view": "^0.1.10",
    "@react-navigation/bottom-tabs": "^5.11.8",
    "@react-navigation/drawer": "^5.12.4",
    "@react-navigation/native": "^5.9.4",
    "@react-navigation/stack": "^5.14.5",
    "@unimodules/core": "^7.0.0",
    "babel-jest": "^26.6.3",
    "babel-preset-react-native": "5.0.2",
    "better-npm-run": "^0.1.1",
    "chalk": "^4.1.1",
    "eslint": "^7.21.0",
    "expo-constants": "^10.0.1",
    "jest": "^26.6.3",
    "metro-config": "^0.65.2",
    "metro-react-native-babel-preset": "^0.64.0",
    "metro-react-native-babel-transformer": "^0.65.2",
    "ora": "^5.4.1",
    "react-native-clean-project": "^3.4.0",
    "react-native-svg-transformer": "^0.14.3",
    "react-test-renderer": "16.13.1",
    "shelljs": "^0.8.4"
  },
  "rnmp": {
    "assets": [
      "./src/assets/fonts/"
    ]
  },
  "jest": {
    "preset": "react-native"
  }
}

```

3. 下载依赖需要用到官方的脚手架工具`yarn`  没有的话需要安装 `brew install yarn`  

```shell
yarn add react-native # 这样安装的是最新版本的ReactNative 相信你肯定想要指定版本

yarn add react-native@0.63.4 # 这样就可以指定版本安装了
```

4. 修改podspec文件内容。到了这一步基本上就是体力活了。这里主要修改有一下几点

- 删除无用的变量 `package["version"]` 等这些 如果下载依赖的时候找不大这些变量pod install 的时候会报错
- 更改源码依赖路径 `s.source`
- 更改头文件源码路径`s.source_files`
- 更改脚本依赖 有一些会有一些脚本执行。看到多有的路径基本上都是要改的。

5.  这些手动搞完估计都有点疲惫了。我也没搞过。我只是觉得可能是会的。最后直接就是创建相应的文件夹然后提交到私有库中了。
6. 这个过程需要反复的验证。最后就可以只需要在podfile 文件中添加依赖执行就好了。相当完美。项目中也不用多一些没用的文件了。看着比较干净。

## 三、脚本自动执行

大家也发现这里面的很大一部分的工作量都是在修改podspec文件。修改指定的路径。这些完全可以用脚本来执行节省工作时间还能避免出错。我这里先抛砖引玉把我写的不好看的代码放出来供大家参考。

```ruby
#!/usr/bin/env ruby
require "json"
require "fileutils"

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

```

这个脚本主要做了这么几件事

1. 获取当前git tags  是否包含package RN version 包含则删除本地tag 删除远端tags 提交新的代码并更新RN tags 
2. 处理本地RNpaakage 删除 node_modules 重新 执行npm install 
3. 获取RN代码仓库地址
4. 处理podspec 
5. 提交代码并提交tag 
6. 生成相应路径到私有库


使用很简单创建一个源码存放的仓库。把package.json 和 脚本放在同一个目录下 然后执行脚本

```shell
ruby rn_script.rb ～.cocoapods/repo/xxxx-specs # 参数为需要输出的posspec 文件路径
```


稍等一下结束以后直接提交一下四有specs 仓库就ok了 在执行 `pod install` 然后就可以愉快的使用了。

## 四、结束语

写这个脚本的初衷是想要组件化。把所有的依赖都cocoapods 管理。ruby 就多少要学一些了。本身对一正则学的也不怎么好。有很多都是靠摸索写的。脚本够用就好了。不要过度投入精力。如果使用的比较多的话有很多地方还是要严谨处理的。

如果你需要做相应的脚本开发你需要掌握一门脚本语言。还有正则表达式的基础知识。 希望看完对你也有一些收获。










