require 'json'



Pod::Spec.new do |s|
  s.name          = 
  s.version       = '0.63.4'
  s.summary        = 'summary'
  s.homepage       = 'git@gitee.com:nehza/rnprivate-libraries.git'
  s.license        = 'MIT'
  s.authors       = 
  s.platform      = :ios, "9.0"
  s.source       = { :git => "git@gitee.com:nehza/rnprivate-libraries.git", :tag => '0.63.4' }
  s.source_files  = "node_modules/react-native-image-base64/node_modules/react-native-image-base64/ios/**/*.{h,m}"
  s.requires_arc  = true
  s.dependency 'React'
end