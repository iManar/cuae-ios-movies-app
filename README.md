# Careem Movies Box
Careem​ ​UAE Assignment - Movies Application "Display and Search"

## Introduction
This app is a simple movies database application. 
The main purpose of this app is displaying list of movies based on the typed search keyword,  also it has a list of suggestions which displayed based on the previous search keywords/ results.
It has been written in swift 4 for iPhone devices with minimum support for iOS 9. The user interface is designed in from storyboard "AutoLayout".


## 📗 Documentation
All methods, properties, and types available in the Movies Box app are documented below.

##### Documentation Table of Contents
* [Screen Shots](#screen-shots)
* [Installation](#installation)
* [CocoaPods](#cocoapods)
* [CocoaPods configuration](#cocoapods-configuration)
* [Architecture](#architecture)
* [Code Snippets](#code-snippets)
* [Dependencies](#dependencies)

## Screen Shots
## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org/) is a dependency manager for Cocoa projects. You can install it with the following command:
```
$ gem install cocoapods
```
> CocoaPods 1.1.0+ is required to build CareemMoviesBox.

### CocoaPods configuration

You just need to run the following command:
```
$ pod install
```

## Architecture
The current architecture of the app is MVP (Model View Presenter).

The most important components are as follow:

1. `MoviesListViewController` – View controller class which acts as the application main view controller. Provides a container for application view controllers. Conforms to `MoviesListViewProtocol` which provides the needed information about the service response.
2. `MoviesListPresenter` - Presenter class conforming to `MoviesListProtocol`  and handles all the logic operations of the movies list view.
3. `AppServiceManager` – It represents the abstract layer that interfaces directly with the network third parties and handles all the request through a generic API called `doRequest(_:)`  - please use it wisely.
4. `SearchManager` - Class that manages all the search requests and parses the returned response to the corresponding model.
5. `MoviesListConstants` - Class that contains all the magic values in the app
6. `TableShowMode` – Table view showing mode enum. If you want to customize the table cell appearance based on set of options like **Loading** show the loading cell for example or the default loader, **Error** show error cell as a placeholder or **Normal** show the default cells.

### Code Snippets
```swift
class func doRequest(path: MoviesDBUrls.Path,
method: HTTPMethod,
params: [String: Any]? = nil,
success: @escaping (_ result: Any) -> Void,
failure: @escaping (_ err: Error) -> Void)
```
This class method provides a way to do any http request
- Parameter path: Enum of predefined set of paths
- Parameter method: Enum of predeefined set of types for the http method
- Parameter success: Success completion block
- Parameter failure: Failure  completion block
```swift
var showingMode: TableShowMode = .loading {
didSet {
// Update the UI
}
}
```
Table view showing mode
## 👥 Dependencies
* [Alamofire](https://github.com/Alamofire/Alamofire)
* [SDWebImage](https://github.com/rs/SDWebImage)
* [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper)
* [SVProgressHUD](https://github.com/SVProgressHUD/SVProgressHUD)
* [IQKeyboardManagerSwift](https://github.com/hackiftekhar/IQKeyboardManager)

