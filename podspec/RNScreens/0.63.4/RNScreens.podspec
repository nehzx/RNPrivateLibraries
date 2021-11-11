require "json"



Pod::Spec.new do |s|
  s.name         = "RNScreens"
  s.version      = '0.63.4'
  s.summary        = 'summary'
  s.description  = <<-DESC
                  RNScreens - first incomplete navigation solution for your React Native app
                   DESC
  s.homepage       = 'git@gitee.com:nehza/rnprivate-libraries.git'
  s.license        = 'MIT'
  # s.license        = 'MIT'
  s.author         = 'author'
  s.platforms    = { :ios => "9.0", :tvos => "11.0" }
  s.source       = { :git => "git@gitee.com:nehza/rnprivate-libraries.git", :tag => '0.63.4' }

  s.source_files = "podspec/RNScreens/0.63.4/podspec/RNScreens/0.63.4/podspec/RNScreens/0.63.4/node_modules/react-native-screens/node_modules/react-native-screens/ios/**/*.{h,m}"
  s.requires_arc = true

  s.dependency "React-Core"
end

