#
#  Be sure to run `pod spec lint GoogleClient.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "GoogleAPISwiftClient"
  s.version      = "0.4.0"
  s.summary      = "A Google API Client for Cocoa and Cocoa Touch in 2015"

  s.description  = <<-DESC
                   A lot of us probably use at least one of Google's public data APIs, and those of us using Cocoa and Cocoa Touch are directed to the open-source [Google APIs Objective-C Client](https://code.google.com/p/google-api-objectivec-client/) for implementation help.
                   It was good for what it was in 2011, but that was before Swift, modern Objective-C, CocoaPods, and even Automatic Reference Counting! Some things in life age well; that library is not one of them. And Google hasn't helped by basically ignoring their client library in these ways.
                   That's why I decided I would try something new. Something that would actually utilize current technologies. Something that would be actually nice for developers to use.
                   I couldn't find what I was looking for, so I decided to build it myself.
                   This library is still in its early stages, but I'm excited for what this library could become!
                   DESC

  s.homepage     = "https://github.com/mattwyskiel/GoogleAPISwiftClient"

  s.license      = "Apache License, Version 2.0"

  s.author             = { "Matthew Wyskiel" => "mwyskiel@optonline.net" }
  s.social_media_url   = "https://twitter.com/mattwyskiel"

  # written in Swift
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"

  s.source       = { :git => "https://github.com/mattwyskiel/GoogleAPISwiftClient.git", :tag => "0.4.0" }

  s.framework  = "Foundation"
  s.requires_arc = true

  s.dependency "Alamofire", "~> 3.1.0"
  s.dependency "ObjectMapper", "~> 1.0.0"

  s.module_name = "GoogleAPIs"

  s.default_subspec = 'Common'

  s.subspec "Common" do |sp|
    sp.source_files  = "GoogleClient/*.{swift}"
  end

  s.subspec "Discovery" do |sp|
    sp.source_files = "GoogleClient/Discovery/*.{swift}"
    sp.dependency 'GoogleAPISwiftClient/Common'
  end

  s.subspec "Blogger" do |sp|
    sp.source_files = "GoogleClient/Blogger/*.{swift}"
    sp.dependency 'GoogleAPISwiftClient/Common'
  end

  s.subspec "YouTube" do |sp|
    sp.source_files = "GoogleClient/YouTube/*.{swift}"
    sp.dependency 'GoogleAPISwiftClient/Common'
  end
end
