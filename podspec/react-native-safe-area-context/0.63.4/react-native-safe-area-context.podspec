require 'json'



Pod::Spec.new do |s|
  s.name         = "react-native-safe-area-context"
  s.version      = '0.63.4'
  s.summary        = 'summary'
  s.license        = 'MIT'

  s.authors      = 
  s.homepage       = 'git@gitee.com:nehza/rnprivate-libraries.git'
  s.platforms    = { :ios => "9.0", :tvos => "9.2" }

  s.source       = { :git => "git@gitee.com:nehza/rnprivate-libraries.git", :tag => '0.63.4' }
  s.source_files  = "podspec/react-native-safe-area-context/0.63.4/podspec/react-native-safe-area-context/0.63.4/podspec/react-native-safe-area-context/0.63.4/podspec/react-native-safe-area-context/0.63.4/podspec/react-native-safe-area-context/0.63.4/node_modules/react-native-safe-area-context/node_modules/react-native-safe-area-context/ios/**/*.{h,m}"

  s.dependency 'React-Core'
end
