require 'json'



Pod::Spec.new do |s|
  s.name         = "RNCMaskedView"
  s.version      = '0.63.4'
  s.summary        = 'summary'
  s.license        = 'MIT'

  s.authors      = 
  s.homepage       = 'git@gitee.com:nehza/rnprivate-libraries.git'
  s.platforms    = { :ios => "9.0", :tvos => "9.0" }

  s.source       = { :git => "git@gitee.com:nehza/rnprivate-libraries.git", :tag => '0.63.4' }
  s.source_files  = "podspec/RNCMaskedView/0.63.4/podspec/RNCMaskedView/0.63.4/podspec/RNCMaskedView/0.63.4/podspec/RNCMaskedView/0.63.4/node_modules/@react-native-community/masked-view/node_modules/@react-native-community/masked-view/ios/**/*.{h,m}"

  s.dependency 'React'
end
