# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

## [0.5.0] - 2016-6-14

### Changed
- All singletons have been removed, in favor of object initialization. This is to support fetcher properties, especially those that will be implemented in a future release to achieve feature parity with Google's official API Client library.

## [0.4.2] - 2016-5-10

### Added
- Added support for media uploads

### Fixed
- Fixed bug where requests did not include API key.

## [0.4.1] - 2016-3-30

### Fixed
- Fixed nullability checking in my custom ObjectMapper `TransformType`
- Fixed model object initialization - can now initialize "blank" objects - set properties later!

### Changed
- Improved error reporting in networking functionality.

### Added
- CHANGELOG.md


## [0.4.0] - 2016-2-28

**Summary** - I was finally able to get the GoogleServiceGenerator to generate the YouTube API client correctly. This is monumental because since the YouTube API is such a behemoth and is so complex, it will be much easier to get the generator to work with other APIs.

### Added
- Generated YouTube API client

### Changed
- Updated model protocol definitions
- Extended `UInt64` to conform to `JSONStringConvertible`

### Fixed
- Much was improved and fixed in the Generator - see the [repo](https://github.com/mattwyskiel/GoogleServiceGenerator) for more information

## [0.3.2] - 2015-12-28

### Added
- Added support for required query parameters in requests

### Changed
- Made fetcher parameters non-optional, instead on implicitly unwrapped

## [0.3.1] - 2015-12-24

### Fixed
- Took nullability into account when negating the API key or access token when the other is set.

## [0.3.0] - 2015-12-12

**Summary** - This is a big moment: the first service has been successfully implemented, automatically using my companion Mac app GoogleServiceGenerator. I chose Blogger as my first service, because it doesn't have too many schemas to deal with, but it also has enough to test my generator and to allow me to fix the big problems where needed.

Something to note when actually using these APIs in your app: Whether the method you call requires an API Key or an OAuth Token, make sure you set whichever authentication key you need on the shared instance of the Blogger fetcher object:

     Blogger.sharedInstance.apiKey = "abcdefghijklmnop1234567890"

### Added
- Blogger API client - first implemented Google service!
- New protocol: `JSONStringConvertible`
- Open-source Google Service Generator - see the [repo](https://github.com/mattwyskiel/GoogleServiceGenerator) for more information
