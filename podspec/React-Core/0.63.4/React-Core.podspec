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
boost_compiler_flags = '-Wno-documentation'

header_subspecs = {
  'ARTHeaders'                  => 'podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/Libraries/ART/**/*.h',
  'CoreModulesHeaders'          => 'podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/React/CoreModules/**/*.h',
  'RCTActionSheetHeaders'       => 'podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/Libraries/ActionSheetIOS/*.h',
  'RCTAnimationHeaders'         => 'podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/Libraries/NativeAnimation/{Drivers/*,Nodes/*,*}.{h}',
  'RCTBlobHeaders'              => 'podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/Libraries/Blob/{RCTBlobManager,RCTFileReaderModule}.h',
  'RCTImageHeaders'             => 'podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/Libraries/Image/*.h',
  'RCTLinkingHeaders'           => 'podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/Libraries/LinkingIOS/*.h',
  'RCTNetworkHeaders'           => 'podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/Libraries/Network/*.h',
  'RCTPushNotificationHeaders'  => 'podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/Libraries/PushNotificationIOS/*.h',
  'RCTSettingsHeaders'          => 'podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/Libraries/Settings/*.h',
  'RCTTextHeaders'              => 'podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/Libraries/Text/**/*.h',
  'RCTVibrationHeaders'         => 'podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/Libraries/Vibration/*.h',
}

Pod::Spec.new do |s|
  s.name                   = "React-Core"
  s.version                = version
  s.summary        = 'summary'
  s.homepage       = 'git@gitee.com:nehza/rnprivate-libraries.git'
  s.license        = 'MIT'
  s.author         = 'author'
  s.platforms              = { :ios => "10.0", :tvos => "10.0" }
  s.source       = { :git => "git@gitee.com:nehza/rnprivate-libraries.git", :tag => '0.63.4' }
  s.resource_bundle        = { "AccessibilityResources" => ["React/AccessibilityResources/*.lproj"]}
  s.compiler_flags         = folly_compiler_flags + ' ' + boost_compiler_flags
  s.header_dir             = "React"
  s.framework              = "JavaScriptCore"
  s.library                = "stdc++"
  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/DoubleConversion\" \"$(PODS_ROOT)/Folly\"", "DEFINES_MODULE" => "YES" }
  s.user_target_xcconfig   = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/Headers/Private/React-Core\""}
  s.default_subspec        = "Default"

  s.subspec "Default" do |ss|
    ss.source_files           = "podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/React/**/*.{c,h,m,mm,S,cpp}"
    ss.exclude_files          = "podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/React/CoreModules/**/*",
                                "podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/React/DevSupport/**/*",
                                "podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/React/Fabric/**/*",
                                "podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/React/Inspector/**/*"
    ss.ios.exclude_files      = "podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/React/**/RCTTV*.*"
    ss.tvos.exclude_files     = "podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/React/Modules/RCTClipboard*",
                                "podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/React/Views/RCTDatePicker*",
                                "podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/React/Views/RCTPicker*",
                                "podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/React/Views/RCTRefreshControl*",
                                "podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/React/Views/RCTSlider*",
                                "podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/React/Views/RCTSwitch*",
    ss.private_header_files   = "podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/React/Cxx*/*.h"
  end

  s.subspec "DevSupport" do |ss|
    ss.source_files = "podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/React/DevSupport/*.{h,mm,m}",
                      "podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/React/Inspector/*.{h,mm,m}"

    ss.dependency "React-Core/Default", version
    ss.dependency "React-Core/RCTWebSocket", version
    ss.dependency "React-jsinspector", version
  end

  s.subspec "RCTWebSocket" do |ss|
    ss.source_files = "podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/podspec/React-Core/0.63.4/node_modules/react-native/node_modules/react-native/Libraries/WebSocket/*.{h,m}"
    ss.dependency "React-Core/Default", version
  end

  # Add a subspec containing just the headers for each
  # pod that should live under <React/*.h>
  header_subspecs.each do |name, headers|
    s.subspec name do |ss|
      ss.source_files = headers
      ss.dependency "React-Core/Default"
    end
  end

  s.dependency "Folly", folly_version
  s.dependency "React-cxxreact", version
  s.dependency "React-jsi", version
  s.dependency "React-jsiexecutor", version
  s.dependency "Yoga"
  s.dependency "glog"
end
