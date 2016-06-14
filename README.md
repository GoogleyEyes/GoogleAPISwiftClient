# Google APIs Swift Client
A lot of us probably use at least one of Google's public data APIs, and those of us using Cocoa and Cocoa Touch are directed to the open-source [Google APIs Objective-C Client](https://code.google.com/p/google-api-objectivec-client/) for implementation help.

It was good for what it was in 2011, but that was before Swift, modern Objective-C, CocoaPods, and even Automatic Reference Counting! Some things in life age well; that library is not one of them. And Google hasn't helped by basically ignoring their client library in these ways. They don't even support it in their new [CocoaPods-based library distribution system](https://developers.google.com/ios/cocoapods#cocoapods_published_by_google)! (Don't be fooled: "Google APIs for iOS" is just an aggregation pod for all the other "modern" libraries that Google supports with this distribution flow, obviously not including the aforementioned Data APIs Client)

That's why I decided I would try something new. Something that would actually utilize current technologies. Something that would be actually nice for developers to use.

I couldn't find what I was looking for, so I decided to build it myself.

This library is still in its early stages. It contains the base model and fetcher classes and protocols, as well as implementations of the [Discovery API](https://developers.google.com/discovery/), the [Blogger API](https://developers.google.com/blogger/), and the [YouTube Data API](https://developers.google.com/youtube/v3/). More services to come! See Contributing below if you would like to help. Even starring this project helps me know this project is worth working on.

## Installation
```ruby
  pod 'GoogleAPISwiftClient/{API}', '~> 0.5.0'
```
where API is the name of the API you wish to use. You can use multiple API's - just use multiple `pod` declarations! API names are listed in the `podspec` file under `subspecs`.

Then import:
```swift
  import GoogleAPIs
```

## Authentication
The Google APIs use one of two methods for authentication: an API Key or OAuth 2.0.

Both the API key and OAuth access token are set directly in the GoogleService protocol conformant, _before any service fetchers that require authentication by either are called_ (see the specific service API's documentation for which authentication method to use for a specific method).

This means that you can use any means necessary to get the OAuth token information and keep it up to date. You can use [GTM-OAuth2](https://code.google.com/p/gtm-oauth2/wiki/Introduction), the new [Google Sign-in SDK](https://developers.google.com/identity/sign-in/ios/), or any other OAuth 2 library to get the job done.

## Basic Usage
Simply use a chosen service's base class (named after itself) to make a request, which then returns the data to a completion handler.

For example, if I wanted to fetch a specific comment for a given Blogger post:
- First I'd initialize the `Blogger` service
```swift
    let bloggerService = Blogger()
```
- Then I'd set the API Key:
```swift
    bloggerService.fetcher.apiKey = "abcdefghijklmnop1234567890" // Example
```
- Then I'd only need to call this method to get a specific comment for a blog post:
```swift
    bloggerService.getCommments(commentId: "abcdef", postId: "ghijkl", blogId: "1234567") {
      comment, error in
      // handle
    }
```

It really is that simple!

## Contributing
- If you would like to help improve the base classes and protocols (GoogleObject, GoogleService, etc.) then feel free to fork and create a pull request for this repository.
- If you would like to add new services, please see [GoogleServiceGenerator](https://github.com/mattwyskiel/GoogleServiceGenerator). That repository hosts the code for the app that generates the code for the Google services.

## License
Apache License, Version 2.0

See LICENSE file for details.
