# Copyright (c) Facebook, Inc. and its affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

require "json"


version = '0.63.4'

source = { :git => 'git@gitee.com:nehza/rnprivate-libraries.git' }
if version == '1000.0.0'
  # This is an unpublished version, use the latest commit hash of the react-native repo, which we’re presumably in.
  source[:commit] = `git rev-parse HEAD`.strip
else
  source[:tag] = "v#{version}"
end

folly_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1'
folly_compiler_flags = folly_flags + ' ' + '-Wno-comma -Wno-shorten-64-to-32'
folly_version = '2020.01.13.00'
boost_compiler_flags = '-Wno-documentation'

Pod::Spec.new do |s|
  s.name                   = "React-RCTFabric"
  s.version                = version
  s.summary        = 'summary'
  s.homepage       = 'git@gitee.com:nehza/rnprivate-libraries.git'
  s.license        = 'MIT'
  s.author         = 'author'
  s.platforms              = { :ios => "10.0", :tvos => "10.0" }
  s.source       = { :git => "git@gitee.com:nehza/rnprivate-libraries.git", :tag => '0.63.4' }
  s.source_files           = "podspec/React-RCTFabric/0.63.4/podspec/React-RCTFabric/0.63.4/podspec/React-RCTFabric/0.63.4/podspec/React-RCTFabric/0.63.4/podspec/React-RCTFabric/0.63.4/podspec/React-RCTFabric/0.63.4/podspec/React-RCTFabric/0.63.4/node_modules/react-native/React/node_modules/react-native/React/Fabric/**/*.{c,h,m,mm,S,cpp}"
  s.exclude_files          = "podspec/React-RCTFabric/0.63.4/podspec/React-RCTFabric/0.63.4/podspec/React-RCTFabric/0.63.4/podspec/React-RCTFabric/0.63.4/podspec/React-RCTFabric/0.63.4/podspec/React-RCTFabric/0.63.4/podspec/React-RCTFabric/0.63.4/node_modules/react-native/React/node_modules/react-native/React/**/tests/*",
                             "podspec/React-RCTFabric/0.63.4/podspec/React-RCTFabric/0.63.4/podspec/React-RCTFabric/0.63.4/podspec/React-RCTFabric/0.63.4/podspec/React-RCTFabric/0.63.4/podspec/React-RCTFabric/0.63.4/podspec/React-RCTFabric/0.63.4/node_modules/react-native/React/node_modules/react-native/React/**/android/*",
  s.compiler_flags         = folly_compiler_flags + ' ' + boost_compiler_flags
  s.header_dir             = "React"
  s.framework              = "JavaScriptCore"
  s.library                = "stdc++"
  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/DoubleConversion\" \"$(PODS_ROOT)/Folly\" \"$(PODS_ROOT)/Headers/Private/React-Core\"" }
  s.xcconfig               = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/glog\" \"$(PODS_ROOT)/Folly\"",
                               "OTHER_CFLAGS" => "$(inherited) -DRN_FABRIC_ENABLED" + " " + folly_flags  }

  s.dependency "React-Core", version
  s.dependency "React-Fabric", version
  s.dependency "React-RCTImage", version
  s.dependency "Folly/Fabric", folly_version
end
