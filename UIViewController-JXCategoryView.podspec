#
# Be sure to run `pod lib lint UIViewController-JXCategoryView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'UIViewController-JXCategoryView'
    s.version          = '0.1.0'
    s.summary          = 'Summary of UIViewController-JXCategoryView.'
    s.description      = <<-DESC
                          A description of UIViewController-JXCategoryView.
                         DESC
    s.homepage         = 'https://github.com/AndyM129/UIViewController-JXCategoryView'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Andy Meng' => 'andy_m129@163.com' }
    s.source           = { :git => 'https://github.com/AndyM129/UIViewController-JXCategoryView.git', :tag => s.version.to_s }
    s.social_media_url = 'http://www.jianshu.com/u/28d89b68984b'
    s.ios.deployment_target = '8.0'
    s.source_files = 'UIViewController-JXCategoryView/Classes/**/*.{h,m}'
    s.public_header_files = 'UIViewController-JXCategoryView/Classes/**/*.h'
    s.frameworks = 'UIKit'
    s.dependency 'JXCategoryView', '1.5.1' # 目前仅针对该版本做了测试
    s.dependency 'AMKCategories/Foundation/NSObject/MethodSwizzling'
end