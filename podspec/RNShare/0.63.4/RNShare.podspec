require "json"



Pod::Spec.new do |s|
  s.name         = "RNShare"
  s.version      = '0.63.4'
  s.summary        = 'summary'
  s.homepage       = 'git@gitee.com:nehza/rnprivate-libraries.git'
  s.license        = 'MIT'
  s.author         = 'author'
  s.platform     = :ios, "8.0"
  s.source       = { :git => "git@gitee.com:nehza/rnprivate-libraries.git", :tag => '0.63.4' }

  s.source_files  = "podspec/RNShare/0.63.4/node_modules/react-native-share/node_modules/react-native-share/ios/**/*.{h,m}"

  s.dependency "React-Core"
end
