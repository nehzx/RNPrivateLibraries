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
folly_dep_name = 'Folly/Fabric'
boost_compiler_flags = '-Wno-documentation'

Pod::Spec.new do |s|
  s.name                   = "React-Fabric"
  s.version                = version
  s.summary        = 'summary'
  s.homepage       = 'git@gitee.com:nehza/rnprivate-libraries.git'
  s.license        = 'MIT'
  s.author         = 'author'
  s.platforms              = { :ios => "10.0", :tvos => "10.0" }
  s.source       = { :git => "git@gitee.com:nehza/rnprivate-libraries.git", :tag => '0.63.4' }
  s.prepare_command        = File.read("podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/../scripts/generate-rncore.sh")
  s.source_files           = "dummyFile.cpp"
  s.library                = "stdc++"
  s.pod_target_xcconfig = { "USE_HEADERMAP" => "YES",
                            "CLANG_CXX_LANGUAGE_STANDARD" => "c++14" }

  s.dependency folly_dep_name, folly_version
  s.dependency "React-graphics", version
  s.dependency "React-jsiexecutor", version
  s.dependency "RCTRequired", version
  s.dependency "RCTTypeSafety", version
  s.dependency "ReactCommon/turbomodule/core", version
  s.dependency "React-jsi", version

  s.subspec "attributedstring" do |ss|
    ss.dependency             folly_dep_name, folly_version
    ss.compiler_flags       = folly_compiler_flags
    ss.source_files         = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/fabric/attributedstring/**/*.{m,mm,cpp,h}"
    ss.exclude_files        = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/**/tests/*"
    ss.header_dir           = "react/attributedstring"
    ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/Folly\"" }
  end

  s.subspec "better" do |ss|
    ss.dependency             folly_dep_name, folly_version
    ss.compiler_flags       = folly_compiler_flags
    ss.source_files         = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/better/**/*.{m,mm,cpp,h}"
    ss.exclude_files        = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/**/tests/*"
    ss.header_dir           = "better"
    ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/Folly\"" }
  end

  s.subspec "config" do |ss|
    ss.source_files         = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/config/*.{m,mm,cpp,h}"
    ss.header_dir           = "react/config"
    ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\"" }
  end

  s.subspec "core" do |ss|
    ss.dependency             folly_dep_name, folly_version
    ss.compiler_flags       = folly_compiler_flags + ' ' + boost_compiler_flags
    ss.source_files         = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/fabric/core/**/*.{m,mm,cpp,h}"
    ss.exclude_files        = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/**/tests/**/*"
    ss.header_dir           = "react/core"
    ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/Folly\"" }
  end

  s.subspec "components" do |ss|
    ss.subspec "activityindicator" do |sss|
      sss.dependency             folly_dep_name, folly_version
      sss.compiler_flags       = folly_compiler_flags
      sss.source_files         = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/fabric/components/activityindicator/**/*.{m,mm,cpp,h}"
      sss.exclude_files        = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/**/tests/*"
      sss.header_dir           = "react/components/activityindicator"
      sss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/Folly\"" }
    end

    ss.subspec "image" do |sss|
      sss.dependency             folly_dep_name, folly_version
      sss.compiler_flags       = folly_compiler_flags
      sss.source_files         = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/fabric/components/image/**/*.{m,mm,cpp,h}"
      sss.exclude_files        = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/**/tests/*"
      sss.header_dir           = "react/components/image"
      sss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/Folly\"" }
    end

    ss.subspec "modal" do |sss|
      sss.dependency             folly_dep_name, folly_version
      sss.compiler_flags       = folly_compiler_flags
      sss.source_files         = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/fabric/components/modal/**/*.{m,mm,cpp,h}"
      sss.exclude_files        = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/**/tests/*"
      sss.header_dir           = "react/components/modal"
      sss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/Folly\"" }
    end

    ss.subspec "rncore" do |sss|
      sss.dependency             folly_dep_name, folly_version
      sss.compiler_flags       = folly_compiler_flags
      sss.source_files         = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/fabric/components/rncore/*.{m,mm,cpp,h}"
      sss.exclude_files        = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/**/tests/*", "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/fabric/components/rncore/*Tests.{h,cpp}"
      sss.header_dir           = "react/components/rncore"
      sss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/Folly\"" }
    end

    ss.subspec "root" do |sss|
      sss.dependency             folly_dep_name, folly_version
      sss.compiler_flags       = folly_compiler_flags
      sss.source_files         = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/fabric/components/root/**/*.{m,mm,cpp,h}"
      sss.exclude_files        = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/**/tests/*"
      sss.header_dir           = "react/components/root"
      sss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/Folly\"" }
    end

    ss.subspec "scrollview" do |sss|
      sss.dependency             folly_dep_name, folly_version
      sss.compiler_flags       = folly_compiler_flags
      sss.source_files         = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/fabric/components/scrollview/**/*.{m,mm,cpp,h}"
      sss.exclude_files        = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/**/tests/*"
      sss.header_dir           = "react/components/scrollview"
      sss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/Folly\"" }
    end

    ss.subspec "slider" do |sss|
      sss.dependency             folly_dep_name, folly_version
      sss.compiler_flags       = folly_compiler_flags
      sss.source_files         = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/fabric/components/slider/**/*.{m,mm,cpp,h}"
      sss.exclude_files        = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/**/tests/*",
                                 "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/**/android/*"
      sss.header_dir           = "react/components/slider"
      sss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/Folly\"" }
    end

    ss.subspec "text" do |sss|
      sss.dependency             folly_dep_name, folly_version
      sss.compiler_flags       = folly_compiler_flags
      sss.source_files         = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/fabric/components/text/**/*.{m,mm,cpp,h}"
      sss.exclude_files        = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/**/tests/*"
      sss.header_dir           = "react/components/text"
      sss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/Folly\"" }
    end

    ss.subspec "view" do |sss|
      sss.dependency             folly_dep_name, folly_version
      sss.dependency             "Yoga"
      sss.compiler_flags       = folly_compiler_flags
      sss.source_files         = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/fabric/components/view/**/*.{m,mm,cpp,h}"
      sss.exclude_files        = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/**/tests/*"
      sss.header_dir           = "react/components/view"
      sss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/Folly\"" }
    end
  end

  s.subspec "debug" do |ss|
    ss.dependency             folly_dep_name, folly_version
    ss.compiler_flags       = folly_compiler_flags
    ss.source_files         = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/fabric/debug/**/*.{m,mm,cpp,h}"
    ss.exclude_files        = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/**/tests/*"
    ss.header_dir           = "react/debug"
    ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/Folly\"" }
  end

  s.subspec "imagemanager" do |ss|
    ss.dependency             "React-RCTImage", version
    ss.dependency             folly_dep_name, folly_version
    ss.compiler_flags       = folly_compiler_flags
    ss.source_files         = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/fabric/imagemanager/**/*.{m,mm,cpp,h}"
    ss.exclude_files        = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/**/tests/*",
                              "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/**/android/*",
                              "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/**/cxx/*"
    ss.header_dir           = "react/imagemanager"
    ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/Folly\"" }
  end

  s.subspec "mounting" do |ss|
    ss.dependency             folly_dep_name, folly_version
    ss.compiler_flags       = folly_compiler_flags
    ss.source_files         = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/fabric/mounting/**/*.{m,mm,cpp,h}"
    ss.exclude_files        = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/**/tests/*"
    ss.header_dir           = "react/mounting"
    ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/Folly\"" }
  end

  s.subspec "textlayoutmanager" do |ss|
    ss.dependency             folly_dep_name, folly_version
    ss.compiler_flags       = folly_compiler_flags
    ss.source_files         = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/fabric/textlayoutmanager/**/*.{m,mm,cpp,h}"
    ss.exclude_files        = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/**/tests/*",
                              "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/**/android/*",
                              "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/**/cxx/*"
    ss.header_dir           = "react/textlayoutmanager"
    ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/Folly\"" }
  end

  s.subspec "uimanager" do |ss|
    ss.dependency             folly_dep_name, folly_version
    ss.compiler_flags       = folly_compiler_flags
    ss.source_files         = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/fabric/uimanager/**/*.{m,mm,cpp,h}"
    ss.exclude_files        = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/**/tests/*",
    ss.header_dir           = "react/uimanager"
    ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/Folly\"" }
  end

  s.subspec "utils" do |ss|
    ss.source_files         = "podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/podspec/React-Fabric/0.63.4/node_modules/react-native/ReactCommon/node_modules/react-native/ReactCommon/utils/*.{m,mm,cpp,h}"
    ss.header_dir           = "react/utils"
    ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/Folly\"" }
  end
end
