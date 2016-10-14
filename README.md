# Phaedo

[![CI Status](http://img.shields.io/travis/Tyler Thompson/Phaedo.svg?style=flat)](https://travis-ci.org/FormidableLabs/Phaedo)
[![Version](https://img.shields.io/cocoapods/v/Phaedo.svg?style=flat)](http://cocoapods.org/pods/Phaedo)
[![License](https://img.shields.io/cocoapods/l/Phaedo.svg?style=flat)](http://cocoapods.org/pods/Phaedo)
[![Platform](https://img.shields.io/cocoapods/p/Phaedo.svg?style=flat)](http://cocoapods.org/pods/Phaedo)

## Docs WIP!

Phaedo is a speedy linear constraint solver for Swift.

Phaedo wraps the [Kiwi](https://github.com/nucleic/kiwi) constraint solver (C++) in a thin layer of Objective-C, then adds operator overloads in Swift for intuitive constraint definitions.

Instances of Phaedo solvers aren't constrained to the UI thread, opening the door for parallel constraint layout. Phaedo's ultimate goal is to form the foundation of a multithreaded replacement for AutoLayout that works in both Swift and React Native.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

Phaedo is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Phaedo"
```

## Author

Tyler Thompson, tyler.thompson@formidable.com

## License

Phaedo is available under the MIT license. See the LICENSE file for more info.
