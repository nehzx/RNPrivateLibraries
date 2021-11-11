require 'json'



Pod::Spec.new do |s|
  s.name         = "react-native-slider"
  s.version      = '0.63.4'
  s.summary        = 'summary'
  s.license        = 'MIT'

  s.authors      = 
  s.homepage       = 'git@gitee.com:nehza/rnprivate-libraries.git'
  s.platform     = :ios, "9.0"

  s.source       = { :git => "git@gitee.com:nehza/rnprivate-libraries.git", :tag => '0.63.4' }
  s.source_files  = "podspec/react-native-slider/0.63.4/podspec/react-native-slider/0.63.4/podspec/react-native-slider/0.63.4/podspec/react-native-slider/0.63.4/podspec/react-native-slider/0.63.4/node_modules/@react-native-community/slider/node_modules/@react-native-community/slider/ios/**/*.{h,m}"

  s.dependency 'React'
end
