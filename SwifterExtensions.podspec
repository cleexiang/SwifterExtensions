Pod::Spec.new do |s|
  s.name             = 'SwifterExtensions'
  s.version          = '1.0.0'
  s.summary          = 'A collection of extensions used for Swift.'
  s.description      = "A collection of extensions written in Swift 4, compatible with iOS 11 and xCode 9."
  s.homepage         = 'https://github.com/cleexiang/SwifterExtensions'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'cleexiang' => 'cleexiang@126.com' }
  s.source           = { :git => 'https://github.com/cleexiang/SwifterExtensions.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'SwifterExtensions/Sources/**/*'

end

