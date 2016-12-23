# HurriyetOpenApi

[![CI Status](http://img.shields.io/travis/Hakkı Yiğit Yener/HurriyetOpenApi.svg?style=flat)](https://travis-ci.org/Hakkı Yiğit Yener/HurriyetOpenApi)
[![Version](https://img.shields.io/cocoapods/v/HurriyetOpenApi.svg?style=flat)](http://cocoapods.org/pods/HurriyetOpenApi)
[![License](https://img.shields.io/cocoapods/l/HurriyetOpenApi.svg?style=flat)](http://cocoapods.org/pods/HurriyetOpenApi)
[![Platform](https://img.shields.io/cocoapods/p/HurriyetOpenApi.svg?style=flat)](http://cocoapods.org/pods/HurriyetOpenApi)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

HurriyetOpenApi will be available through [CocoaPods](http://cocoapods.org). To install
it now, simply add the following line to your Podfile:

```ruby
pod 'HurriyetOpenApi' ,:git=> 'https://github.com/hurriyet/hurriyet-public-api-ios-sdk.git', :branch => 'master'
```
If you get Swift version error please add these to end of the podfile

```ruby
post_install do |installer|
   installer.pods_project.targets.each do |target|
       target.build_configurations.each do |config|
           config.build_settings['SWIFT_VERSION'] = '3.0'
       end
   end
end
```

## Author

Hurriyet Mobile Team, MobilEkip@hurriyet.com.tr

## License

HurriyetOpenApi is available under the MIT license. See the LICENSE file for more info.
# hurriyet-public-api-ios-sdk
