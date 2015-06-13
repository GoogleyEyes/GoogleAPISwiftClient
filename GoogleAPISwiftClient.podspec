#
#  Be sure to run `pod spec lint GoogleClient.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "GoogleAPISwiftClient"
  s.version      = "0.0.3"
  s.summary      = "A Google API Client for Cocoa and Cocoa Touch in 2015"

  s.description  = <<-DESC
                   A lot of us probably use at least one of Google's public data APIs, and those of us using Cocoa and Cocoa Touch are directed to the open-source [Google APIs Objective-C Client](https://code.google.com/p/google-api-objectivec-client/) for implementation help.
                   It was good for what it was in 2011, but that was before Swift, modern Objective-C, CocoaPods, and even Automatic Reference Counting! Some things in life age well; that library is not one of them. And Google hasn't helped by basically ignoring their client library in these ways.
                   That's why I decided I would try something new. Something that would actually utilize current technologies. Something that would be actually nice for devs to use.
                   I couldn't find what I was looking for, so I decided to build it myself.
                   This current version only contains the base model and fetcher classes and protocols. I have another branch set up for the first service to be implemented, which is Blogger.
                   DESC

  s.homepage     = "https://github.com/mattwyskiel/GoogleAPISwiftClient"

  s.license      = "Apache License, Version 2.0"

  s.author             = { "Matthew Wyskiel" => "mwyskiel@optonline.net" }
  s.social_media_url   = "https://twitter.com/mattwyskiel"

  # written in Swift
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"

  s.source       = { :git => "https://github.com/mattwyskiel/GoogleAPISwiftClient.git", :tag => "0.0.3" }
  s.source_files  = "GoogleClient/*.{swift}"

  s.framework  = "Foundation"
  s.requires_arc = true

  s.dependency "Alamofire", "~> 1.2"
  s.dependency "ObjectMapper", "~> 0.11"

  s.module_name = "GoogleAPIs"

end
