#
# Be sure to run `pod lib lint FORScrollViewEmptyAssistant.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "FORScrollViewEmptyAssistant"
  s.version          = "0.1.1"
  s.summary          = "Table/Collection的空白页"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  UI列表数据为空的空白页，可以自定义空白页的样式,包括空白图，标题，副标题及按钮四个元素。
                       DESC

  s.homepage         = "https://github.com/ZhipingYang/FORScrollViewEmptyAssistant"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "XcodeYang" => "xcodeyang@gmail.com" }
  s.source           = { :git => "https://github.com/ZhipingYang/FORScrollViewEmptyAssistant.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'FORScrollViewEmptyAssistant/Classes/**/*'
  
  s.resource_bundles = {
    'FORScrollViewEmptyAssistant' => ['FORScrollViewEmptyAssistant/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'DZNEmptyDataSet', '~> 1.5.2'
end
