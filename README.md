# miniapp-appkit-sdk

## Table of Contents

1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Description](#description)
4. [Usage](#usage)
5. [Support](#support)
6. [Roadmap](#roadmap)

## Introduction

This library is an extension to [miniapp-core-sdk](https://github.com/stanydsouza/miniapp-core-sdk.git) library along with AppKit Navigation logic to peform navigation between diffrent MiniApp's. This library consists the `miniapp_core` & `miniapp_appkit` framework.

### What is a MiniApp?

​
Mini apps are indpendent modules that provide functionalities such as content display, data input, social sharing, payment processing, and more. Mini apps are typically developed using platform-specific frameworks or development kits provided by the platform or ecosystem they are built for. The key advantages of mini apps include their lightweight nature, ease of use, and seamless integration with the hosting platform.

&nbsp;

## Installation

### Swift Package Manager

To integrate `miniapp_appkit` SDK into your Xcode project using Swift Package Manager, add it to the dependencies value of your Package.swift:

```swift
dependencies: [
    .package(url: "https://github.com/stanydsouza/miniapp-appkit-sdk.git", .upToNextMajor(from: "0.0.1"))
]
```

### Requirements

Swift Version: 5.10

| Supported Platform | Min. Version |
| ------------------ | ------------ |
| macOS              |    11.0      |

&nbsp;

## Description

The `miniapp_appkit` framework implements the navigation logic for the Navigation module of [miniapp-core-sdk](https://github.com/stanydsouza/miniapp-core-sdk.git).

### MiniApp_AppKit

It's a namespace which provide access to Navigation module of the SDK.

```swift
public enum MiniApp_AppKit {
    public static let Navigation: NavigationProtocol
}
```

### Navigation

Navigation Module allows us to configure MiniApp's & navigation between them.

```swift
public protocol NavigationProtocol {
    func config(rootViewController: NSViewController, window: NSWindow, appDelegate: NSApplicationDelegate, miniApps: [any MiniApp])
}
```

```swift
public protocol MiniApp {
    var name: String { get } // Name of the MiniApp
    var viewController: NSViewController { get } // NSViewController object for the MiniApp
}
```

&nbsp;

## Usage

```swift
// Viewcontrollers & MiniApps
import AppKit

final class SplashViewController: NSViewController {
    ...
}

final class LoginViewController: NSViewController {
    ...
}

final class HomeViewController: NSViewController {
    ...
}

struct LoginMiniApp: MiniApp {
    var name: String = "Login"
    var viewController: NSViewController = LoginViewController()
}

struct HomeMiniApp: MiniApp {
    var name: String = "Home"
    var viewController: NSViewController = HomeViewController()
}
```

```swift
import miniapp_appkit

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let window = NSWindow(
        contentRect: NSMakeRect(0, 0, NSScreen.main!.frame.width, NSScreen.main!.frame.height),
        styleMask: .defaultWindow,
        backing: .buffered,
        defer: false
    )

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        MiniApp_AppKit.Navigation.config(
            rootViewController: SplashViewController(), 
            window: window,
            appDelegate: self,
            miniApps: [
                LoginMiniApp(),
                HomeMiniApp()
            ]
        )
        
    }

}
```

In `SplashViewController`, we can configure the routing data & show the first screen

```swift
import miniapp_core

final class SplashViewController: NSViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Get the routing json logic

        MiniAppCore.Navigation.configRouters(routers: json, currentMiniApp: "Login")
    }

}
```

&nbsp;

## Support

Email: <stany.d@bluebikglobal.com>

&nbsp;

## Roadmap

- Swift 6 support

&nbsp;

## License

MIT License
