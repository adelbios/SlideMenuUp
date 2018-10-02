#
# Be sure to run `pod lib lint SlideMenuUp.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SlideMenuUp'
  s.version          = '1.0'
  s.summary          = 'is menu appear from bottom to Up'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
 is menu appear from bottom to Up its called SlideMenuUp , its look like a youtube application when click on three dots (settings button)
                       DESC

  s.homepage         = 'https://github.com/adelbios/SlideMenuUp'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Adel Radwan' => 'adelbios11@gmail.com' }
  s.source           = { :git => 'https://github.com/adelbios/SlideMenuUp.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/adel_Radwan11'

  s.ios.deployment_target = '9.0'

  s.source_files = 'SlideMenuUp/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SlideMenuUp' => ['SlideMenuUp/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
