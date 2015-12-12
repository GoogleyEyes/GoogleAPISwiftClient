# Google APIs Swift Client
A lot of us probably use at least one of Google's public data APIs, and those of us using Cocoa and Cocoa Touch are directed to the open-source [Google APIs Objective-C Client](https://code.google.com/p/google-api-objectivec-client/) for implementation help.

It was good for what it was in 2011, but that was before Swift, modern Objective-C, CocoaPods, and even Automatic Reference Counting! Some things in life age well; that library is not one of them. And Google hasn't helped by basically ignoring their client library in these ways. They don't even support it in their new [CocoaPods-based library distribution system](https://developers.google.com/ios/cocoapods#cocoapods_published_by_google)! (Don't be fooled: "Google APIs for iOS" is just an aggregation pod for all the other "modern" libraries that Google supports with this distribution flow, obviously not including the aforementioned Data APIs Client)

That's why I decided I would try something new. Something that would actually utilize current technologies. Something that would be actually nice for developers to use.

I couldn't find what I was looking for, so I decided to build it myself.

This library is still in its early stages. It contains the base model and fetcher classes and protocols, as well as an implementation of the [Discovery API](https://developers.google.com/discovery/) and the [Blogger API](https://developers.google.com/blogger/). More services to come! See Contributing below if you would like to help.

Please feel free to help move this project along in any way you see fit, whether it be filing issues or submitting pull requests. Even starring helps me know this project is worth working on.

## Installation
```ruby
  pod 'GoogleAPISwiftClient', '~> 0.1.0'
```

Then import:
```swift
  import GoogleAPIs
```

## Authentication
The Google APIs use one of two methods for authentication: an API Key or OAuth 2.0.

Both the API key and OAuth access token are set directly in the GoogleService protocol conformant. This means you can use any means necessary to get the OAuth token information and keep it up to date. You can use [GTM-OAuth2](https://code.google.com/p/gtm-oauth2/wiki/Introduction), the new [Google Sign-in SDK](https://developers.google.com/identity/sign-in/ios/), or any other OAuth 2 library to get the job done.

## Basic Fetcher Usage
The bulk of the client library at this point is the fetcher class which has one simple, yet powerful method:

```swift
performRequest(method: Alamofire.Method = .GET, serviceName: String, apiVersion: String, endpoint: String, queryParams: [String: String], completionHandler: (JSON: String?, error: NSError?) -> ())
```

Yes, this library uses [Alamofire](https://github.com/Alamofire/Alamofire) under the hood.

## Contributing
- If you would like to help improve the base classes and protocols (GoogleObject, GoogleService, etc.) then feel free to fork and create a pull request for this repository.
- If you would like to add new services, please see [GoogleServiceGenerator](https://github.com/mattwyskiel/GoogleServiceGenerator). That repository hosts the code for the app that generates the code for the Google services.

## License
Apache License, Version 2.0

See LICENSE file for details.
