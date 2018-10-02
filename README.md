# SlideMenuUp

[![CI Status](https://img.shields.io/travis/MEIEEPgAAAAAAAAAAAAAAAAAAAEwFAYIKoZIhvcNAwcECKmNZ8DdASA6BBjbzvQl7td8tMu/dmaBLwm1VFqNmWIIVHE=/SlideMenuUp.svg?style=flat)](https://travis-ci.org/MEIEEPgAAAAAAAAAAAAAAAAAAAEwFAYIKoZIhvcNAwcECKmNZ8DdASA6BBjbzvQl7td8tMu/dmaBLwm1VFqNmWIIVHE=/SlideMenuUp)
[![Version](https://img.shields.io/cocoapods/v/SlideMenuUp.svg?style=flat)](https://cocoapods.org/pods/SlideMenuUp)
[![License](https://img.shields.io/cocoapods/l/SlideMenuUp.svg?style=flat)](https://cocoapods.org/pods/SlideMenuUp)
[![Platform](https://img.shields.io/cocoapods/p/SlideMenuUp.svg?style=flat)](https://cocoapods.org/pods/SlideMenuUp)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.
```swift
let menuVC = MenuViewController()
menuVC.headerTitle = "Select from A menu"

menuVC.menuItem = [
MenuDataSource(title:"Account",image: UIImage()),
MenuDataSource(title:"Report",image:UIImage()),
MenuDataSource(title:"Setting",image:UIImage()),
MenuDataSource(title:"Close",image:UIImage())]

menuVC.didSelectItemWith = { index in
print(index)
}

menuVC.show()
```
## CUSTOMIZE STYLE
```swift
let menuVC = MenuViewController()
menuVC.tableViewRowHeight  = 50
menuVC.headerTextAlignment = .center
menuVC.headerTextColor     = .red
menuVC.headerTextFont      = .systemFont(ofSize: 15)
menuVC.menuItemTextFont    = .systemFont(ofSize: 15)
menuVC.menuItemTextColor   = .orange
menuVC.menuIconColor       = .red
```


## Installation

SlideMenuUp is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SlideMenuUp'
```

## Author

Adel Radwan, adelbios11@gmail.com

## License

SlideMenuUp is available under the MIT license. See the LICENSE file for more info.
