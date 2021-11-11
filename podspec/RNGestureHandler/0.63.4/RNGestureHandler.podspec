require "json"

Pod::Spec.new do |s|
  # NPM package specification
  package = JSON.parse(File.read(File.join(File.dirname(__FILE__), "package.json")))

  s.name         = "RNGestureHandler"
  s.version      = '0.63.4'
  s.summary        = 'summary'
  s.homepage       = 'git@gitee.com:nehza/rnprivate-libraries.git'
  s.license        = 'MIT'
  s.author         = 'author'
  s.platforms    = { :ios => "9.0", :tvos => "9.0" }
  s.source       = { :git => "git@gitee.com:nehza/rnprivate-libraries.git", :tag => '0.63.4' }
  s.source_files = "podspec/RNGestureHandler/0.63.4/podspec/RNGestureHandler/0.63.4/podspec/RNGestureHandler/0.63.4/podspec/RNGestureHandler/0.63.4/podspec/RNGestureHandler/0.63.4/podspec/RNGestureHandler/0.63.4/podspec/RNGestureHandler/0.63.4/node_modules/react-native-gesture-handler/node_modules/react-native-gesture-handler/ios/**/*.{h,m}"

  s.dependency "React-Core"

end
