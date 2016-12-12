# HLPopManager

[![CI Status](http://img.shields.io/travis/monkeyRing/HLPopManager.svg?style=flat)](https://travis-ci.org/monkeyRing/HLPopManager)
[![Version](https://img.shields.io/cocoapods/v/HLPopManager.svg?style=flat)](http://cocoapods.org/pods/HLPopManager)
[![License](https://img.shields.io/cocoapods/l/HLPopManager.svg?style=flat)](http://cocoapods.org/pods/HLPopManager)
[![Platform](https://img.shields.io/cocoapods/p/HLPopManager.svg?style=flat)](http://cocoapods.org/pods/HLPopManager)

## Preview


[screenshot](https://github.com/MonkeyRing/HLPopManager/blob/master/screenshot.gif)


## Example

### Use following command: 

```
 $ git clone https://github.com/MonkeyRing/HLPopManager.git   ||   download this zip.
```

## Requirements
 *  **Xcode 8.1 +**
 *  **iOS 9.0 +**
 *  **Swift 3.0 +**

## Installation
## CocoaPods 

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```
$ gem install cocoapods
```

HLPopManager is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!
inhibit_all_warnings!

target :<Your Target Name> do
    pod 'HLPopManager'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'NO'
            config.build_settings['SWIFT_VERSION'] = '3.0' # or '2.3'
        end
    end
end

```

#### Then, run the following command:

```
 $ pod install
```

## Author

hailong.huang, 502086651@qq.com

## License

HLPopManager is available under the MIT license. See the LICENSE file for more info.
