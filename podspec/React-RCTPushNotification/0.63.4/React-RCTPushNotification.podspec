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

folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'
folly_version = '2020.01.13.00'

Pod::Spec.new do |s|
  s.name                   = "React-RCTPushNotification"
  s.version                = version
  s.summary        = 'summary'
  s.homepage       = 'git@gitee.com:nehza/rnprivate-libraries.git'
  s.documentation_url      = "https://reactnative.dev/docs/pushnotificationios"
  s.license        = 'MIT'
  s.author         = 'author'
  s.platforms              = { :ios => "10.0", :tvos => "10.0" }
  s.compiler_flags         = folly_compiler_flags + ' -Wno-nullability-completeness'
  s.source       = { :git => "git@gitee.com:nehza/rnprivate-libraries.git", :tag => '0.63.4' }
  s.source_files           = "podspec/React-RCTPushNotification/0.63.4/node_modules/react-native/Libraries/PushNotificationIOS/node_modules/react-native/Libraries/PushNotificationIOS/*.{m,mm}"
  s.preserve_paths         = "package.json", "LICENSE", "LICENSE-docs"
  s.header_dir             = "RCTPushNotification"
  s.pod_target_xcconfig    = {
                               "USE_HEADERMAP" => "YES",
                               "CLANG_CXX_LANGUAGE_STANDARD" => "c++14",
                               "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/Folly\""
                             }
  s.framework              = "UserNotifications"

  s.dependency "FBReactNativeSpec", version
  s.dependency "RCTTypeSafety", version
  s.dependency "React-Core/RCTPushNotificationHeaders", version
  s.dependency "ReactCommon/turbomodule/core", version
  s.dependency "React-jsi", version
end
