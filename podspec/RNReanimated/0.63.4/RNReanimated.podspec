require "json"



Pod::Spec.new do |s|
  s.name         = "RNReanimated"
  s.version      = '0.63.4'
  s.summary        = 'summary'
  s.description  = <<-DESC
                  RNReanimated
                   DESC
  s.homepage       = 'git@gitee.com:nehza/rnprivate-libraries.git'
  s.license        = 'MIT'
  # s.license        = 'MIT'
  s.author         = 'author'
  s.platforms    = { :ios => "9.0", :tvos => "9.0" }
  s.source       = { :git => "git@gitee.com:nehza/rnprivate-libraries.git", :tag => '0.63.4' }

  s.source_files = "node_modules/react-native-reanimated/node_modules/react-native-reanimated/ios/**/*.{h,m}"
  s.requires_arc = true

  s.dependency "React-Core"
end

