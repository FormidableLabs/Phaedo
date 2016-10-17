Pod::Spec.new do |s|
  s.name             = 'Phaedo'
  s.version          = '0.1.1'
  s.summary          = 'A speedy constraints solver for Swift.'

  s.description      = <<-DESC
Phaedo is a speedy linear constraint solver for Swift. Phaedo wraps the
Kiwi constraint solver (C++) in a thin layer of Objective-C, then adds
operator overloads in Swift for intuitive constraint definitions.
                       DESC

  s.homepage         = 'https://github.com/FormidableLabs/Phaedo'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tyler Thompson' => 'tyler.thompson@formidable.com' }
  s.source           = { :git => 'https://github.com/FormidableLabs/Phaedo.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/tptee'

  s.ios.deployment_target = '9.0'

  s.source_files = 'Source/**/*'

  # Any pure C++ headers need to be declared private or
  # `pod lib lint` will fail!
  s.public_header_files = 'Source/kiwi-objc/**/*.h'
  s.private_header_files = 'Source/kiwi/**/*.h'

  s.library = 'c++'
  s.xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11',
    'CLANG_CXX_LIBRARY' => 'libc++'
  }
end
