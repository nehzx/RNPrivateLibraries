require 'json'
version = '0.63.4'

Pod::Spec.new do |s|
  s.name           = 'RNSentry'
  s.version        = version
  s.license        = 'MIT'
  s.summary        = 'summary'
  s.author         = 'author'
  s.homepage       = 'git@gitee.com:nehza/rnprivate-libraries.git'
  s.source       = { :git => "git@gitee.com:nehza/rnprivate-libraries.git", :tag => '0.63.4' }

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.tvos.deployment_target = "9.0"

  s.preserve_paths = '*.js'

  s.dependency 'React-Core'
  s.dependency 'Sentry', '7.1.4'

  s.source_files = 'podspec/RNSentry/0.63.4/podspec/RNSentry/0.63.4/podspec/RNSentry/0.63.4/podspec/RNSentry/0.63.4/podspec/RNSentry/0.63.4/podspec/RNSentry/0.63.4/podspec/RNSentry/0.63.4/node_modules/@sentry/react-native/node_modules/@sentry/react-native/ios/RNSentry.{h,m}'
  s.public_header_files = 'podspec/RNSentry/0.63.4/podspec/RNSentry/0.63.4/podspec/RNSentry/0.63.4/podspec/RNSentry/0.63.4/podspec/RNSentry/0.63.4/podspec/RNSentry/0.63.4/podspec/RNSentry/0.63.4/node_modules/@sentry/react-native/node_modules/@sentry/react-native/ios/RNSentry.h'
end
