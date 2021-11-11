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

Pod::Spec.new do |s|
  s.name                   = "React-RCTActionSheet"
  s.version                = version
  s.summary        = 'summary'
  s.homepage       = 'git@gitee.com:nehza/rnprivate-libraries.git'
  s.documentation_url      = "https://reactnative.dev/docs/actionsheetios"
  s.license        = 'MIT'
  s.author         = 'author'
  s.platforms              = { :ios => "10.0", :tvos => "10.0" }
  s.source       = { :git => "git@gitee.com:nehza/rnprivate-libraries.git", :tag => '0.63.4' }
  s.source_files           = "podspec/React-RCTActionSheet/0.63.4/podspec/React-RCTActionSheet/0.63.4/podspec/React-RCTActionSheet/0.63.4/podspec/React-RCTActionSheet/0.63.4/podspec/React-RCTActionSheet/0.63.4/podspec/React-RCTActionSheet/0.63.4/podspec/React-RCTActionSheet/0.63.4/podspec/React-RCTActionSheet/0.63.4/podspec/React-RCTActionSheet/0.63.4/node_modules/react-native/Libraries/ActionSheetIOS/node_modules/react-native/Libraries/ActionSheetIOS/*.{m}"
  s.preserve_paths          = "package.json", "LICENSE", "LICENSE-docs"
  s.header_dir             = "RCTActionSheet"

  s.dependency "React-Core/RCTActionSheetHeaders", version
end
