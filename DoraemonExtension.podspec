#
# Be sure to run `pod lib lint DoraemonExtension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DoraemonExtension'
  s.version          = '1.0.2'
  s.summary          = 'DoraemonKit扩展，解决NSLog奔溃问题'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  解决NSLog奔溃问题
                       DESC

  s.homepage         = 'https://github.com/Alfie/DoraemonExtension'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alfie' => '418983798@qq.com' }
  s.source           = { :git => 'https://github.com/yxh418983798/DoraemonExtension.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.dependency 'DoraemonKit'

  s.source_files = 'DoraemonExtension/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DoraemonExtension' => ['DoraemonExtension/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
