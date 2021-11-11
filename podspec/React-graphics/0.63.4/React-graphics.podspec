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
  s.name                   = "React-graphics"
  s.version                = version
  s.summary        = 'summary'
  s.homepage       = 'git@gitee.com:nehza/rnprivate-libraries.git'
  s.license        = 'MIT'
  s.author         = 'author'
  s.platforms              = { :ios => "9.0", :tvos => "10.0" }
  s.source       = { :git => "git@gitee.com:nehza/rnprivate-libraries.git", :tag => '0.63.4' }
  s.library                = "stdc++"
  s.compiler_flags         = folly_compiler_flags
  s.source_files           = "podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/node_modules/react-native/ReactCommon/fabric/graphics/node_modules/react-native/ReactCommon/fabric/graphics/**/*.{m,mm,cpp,h}"
  s.exclude_files          = "podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/node_modules/react-native/ReactCommon/fabric/graphics/node_modules/react-native/ReactCommon/fabric/graphics/**/tests/*",
                             "podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/node_modules/react-native/ReactCommon/fabric/graphics/node_modules/react-native/ReactCommon/fabric/graphics/**/android/*",
                             "podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/podspec/React-graphics/0.63.4/node_modules/react-native/ReactCommon/fabric/graphics/node_modules/react-native/ReactCommon/fabric/graphics/**/cxx/*"
  s.header_dir             = "react/graphics"
  s.pod_target_xcconfig  = { "USE_HEADERMAP" => "NO", "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/Folly\"" }

  s.dependency "Folly/Fabric", folly_version
end
