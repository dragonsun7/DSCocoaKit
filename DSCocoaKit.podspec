Pod::Spec.new do |s|
s.name = 'DSCocoaKit'
s.summary = 'A collection of iOS components.'
s.version = '0.0.2'
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.authors = { '滚龙' => 'dragonsun7@163.com' }
s.homepage = 'https://github.com/dragonsun7/DSCocoaKit'
s.platform = :ios, '10.0'
s.ios.deployment_target = '10.0'
s.source = { :git => 'https://github.com/dragonsun7/DSCocoaKit.git', :tag => s.version.to_s }

s.requires_arc = true
s.source_files = 'DSCocoaKit/**/*.{h,m}'
s.public_header_files = 'DSCocoaKit/**/*.{h}'

end
