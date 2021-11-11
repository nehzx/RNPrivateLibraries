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
  s.name                   = "React"
  s.version                = version
  s.summary        = 'summary'
  s.description            = <<-DESC
                               React Native apps are built using the React JS
                               framework, and render directly to native UIKit
                               elements using a fully asynchronous architecture.
                               There is no browser and no HTML. We have picked what
                               we think is the best set of features from these and
                               other technologies to build what we hope to become
                               the best product development framework available,
                               with an emphasis on iteration speed, developer
                               delight, continuity of technology, and absolutely
                               beautiful and fast products with no compromises in
                               quality or capability.
                             DESC
  s.homepage       = 'git@gitee.com:nehza/rnprivate-libraries.git'
  s.license        = 'MIT'
  s.author         = 'author'
  s.platforms              = { :ios => "10.0", :tvos => "10.0" }
  s.source       = { :git => "git@gitee.com:nehza/rnprivate-libraries.git", :tag => '0.63.4' }
  s.preserve_paths         = "package.json", "LICENSE", "LICENSE-docs"
  s.cocoapods_version      = ">= 1.2.0"

  s.dependency "React-Core", version
  s.dependency "React-Core/DevSupport", version
  s.dependency "React-Core/RCTWebSocket", version
  s.dependency "React-RCTActionSheet", version
  s.dependency "React-RCTAnimation", version
  s.dependency "React-RCTBlob", version
  s.dependency "React-RCTImage", version
  s.dependency "React-RCTLinking", version
  s.dependency "React-RCTNetwork", version
  s.dependency "React-RCTSettings", version
  s.dependency "React-RCTText", version
  s.dependency "React-RCTVibration", version
end
