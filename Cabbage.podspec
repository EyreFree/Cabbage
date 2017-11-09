
Pod::Spec.new do |s|
  s.name             = 'Cabbage'
  s.version          = '4.0.0'
  s.summary          = 'A Cabbage.'

  s.description      = 'A very very very very very very very very very very very very very very very big Cabbage.'

  s.homepage         = 'https://github.com/EyreFree/Cabbage'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'EyreFree' => 'eyrefree@eyrefree.org' }
  s.source           = { :git => 'https://github.com/EyreFree/Cabbage.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/EyreFree777'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Cabbage/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Cabbage' => ['Cabbage/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'ReSwift', '~> 4.0.0'
end
