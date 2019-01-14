#
# Be sure to run `pod lib lint ZKActivityIndicator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZKActivityIndicator'
  s.version          = '0.1.0'
  s.summary          = 'A ActivityIndicator simple used just like UIActivityIndicatorView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
ActivityIndicator use just like UIActivityIndicatorView but better user interface
                       DESC

  s.homepage         = 'https://github.com/LINAICAI/ZKActivityIndicator'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LINAICAI' => 'linaicai2012@gmail.com' }
  s.source           = { :git => 'https://github.com/LINAICAI/ZKActivityIndicator.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'

  s.source_files = 'ZKActivityIndicator/Classes/**/*'
  s.frameworks = 'UIKit'
end
