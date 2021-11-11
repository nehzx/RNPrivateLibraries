require 'json'
version = '0.63.4'

Pod::Spec.new do |s|

  s.name            = "BVLinearGradient"
  s.version         = version
  s.homepage       = 'git@gitee.com:nehza/rnprivate-libraries.git'
  s.summary        = 'summary'
  s.license        = 'MIT'
  s.author         = 'author'
  s.ios.deployment_target = '7.0'
  s.tvos.deployment_target = '9.0'
  s.source       = { :git => "git@gitee.com:nehza/rnprivate-libraries.git", :tag => '0.63.4' }
  s.source_files    = 'podspec/BVLinearGradient/0.63.4/node_modules/react-native-linear-gradient/node_modules/react-native-linear-gradient/BVLinearGradient/*.{h,m}'
  s.preserve_paths  = "**/*.js"
  s.frameworks = 'UIKit', 'QuartzCore', 'Foundation'

  s.dependency 'React'

end
