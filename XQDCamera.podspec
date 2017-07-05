#
# Be sure to run `pod lib lint XQDCamera.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XQDCamera'
  s.version          = '0.0.1'
  s.summary          = 'A short description of XQDCamera.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/acct<blob>=<NULL>/XQDCamera'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'EriceWang' => 'wangerdong@treefinance.com.cn' }
  s.source           = { :git => '/Users/wangxiaodong/Desktop/Temporary/XQDCamera', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'
  s.source_files = 'XQDCamera/Classes/**/*'
   s.resource_bundles = {
     'XQDCameraResource' => ['XQDCamera/Assets/*']
   }
  s.public_header_files = 'XQDCamera/Classes/**/XQDCamera.h'
   s.frameworks = 'UIKit'
   s.dependency 'LLSimpleCamera','~> 3.0.0'
end
