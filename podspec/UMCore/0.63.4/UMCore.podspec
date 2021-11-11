require 'json'



Pod::Spec.new do |s|
  s.name           = 'UMCore'
  s.version        = '0.63.4'
  s.summary        = 'summary'
  s.description    = 
  s.license        = 'MIT'
  s.author         = 'author'
  s.homepage       = 'git@gitee.com:nehza/rnprivate-libraries.git'
  s.platform       = :ios, '11.0'
  s.source       = { :git => "git@gitee.com:nehza/rnprivate-libraries.git", :tag => '0.63.4' }

  if !$ExpoUseSources&.include?(
    s.source_files = "podspec/UMCore/0.63.4/podspec/UMCore/0.63.4/podspec/UMCore/0.63.4/podspec/UMCore/0.63.4/podspec/UMCore/0.63.4/podspec/UMCore/0.63.4/podspec/UMCore/0.63.4/podspec/UMCore/0.63.4/node_modules/@unimodules/core/ios/node_modules/@unimodules/core/ios/#{s.name}/**/*.h"
    s.vendored_frameworks = "#{s.name}.xcframework"
  else
    s.source_files = "podspec/UMCore/0.63.4/podspec/UMCore/0.63.4/podspec/UMCore/0.63.4/podspec/UMCore/0.63.4/podspec/UMCore/0.63.4/podspec/UMCore/0.63.4/podspec/UMCore/0.63.4/podspec/UMCore/0.63.4/node_modules/@unimodules/core/ios/node_modules/@unimodules/core/ios/#{s.name}/**/*.{h,m}"
  end
end
