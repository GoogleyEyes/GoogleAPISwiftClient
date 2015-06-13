# GoogleAPISwiftClient
A lot of us probably use at least one of Google's public data APIs, and those of us using Cocoa and Cocoa Touch are directed to the open-source [Google APIs Objective-C Client](https://code.google.com/p/google-api-objectivec-client/) for implementation help.

It was good for what it was in 2011, but that was before Swift, modern Objective-C, CocoaPods, and even Automatic Reference Counting! Some things in life age well; that library is not one of them. And Google hasn't helped by basically ignoring their client library in these ways. They don't even support it in their new [CocoaPods-based library distribution system](https://developers.google.com/ios/cocoapods#cocoapods_published_by_google)! (Don't be fooled: "Google APIs for iOS" is just an aggregation pod for all the other "modern" libraries that Google supports with this distribution flow, obviously not including the aforementioned Data APIs Client)

That's why I decided I would try something new. Something that would actually utilize current technologies. Something that would be actually nice for devs to use.

I couldn't find what I was looking for, so I decided to build it myself.

This current version only contains the base model and fetcher classes and protocols. I have another branch set up for the first service to be implemented, which is Blogger.

Please feel free to help move this project along in any way you see fit, whether it be filing issues or submitting pull requests. Even starring helps me know this project is worth working on.

## Installation
```ruby
  pod 'GoogleAPISwiftClient', '~> 0.0.3'
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
A few implementation details to note for new services to be implemented:
- All services must conform to the `GoogleService` protocol
- All objects (or "schemas" if you're working with the Discovery API for help here) must conform to the `GoogleObject` protocol, which conforms to [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper)'s `Mappable` protocol
- All object lists (e.g. a Blog List or a Videos List) are their own distinct objects and must conform to the `GoogleObjectList` protocol, which also conforms to `Mappable`

This will be easier to understand once the first service is successfully implemented.

## License
Apache License, Version 2.0

See LICENSE file for details.
