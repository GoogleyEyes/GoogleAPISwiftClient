//
//  YoutubeImageSettings.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeImageSettings: ObjectType {
	/// Banner image. Mobile size high resolution (1440x395).
	public var bannerMobileExtraHdImageUrl: String!
	/// The image map script for the small banner image.
	public var smallBrandedBannerImageImapScript: YoutubeLocalizedProperty!
	/// Banner image. Mobile size low resolution (320x88).
	public var bannerMobileLowImageUrl: String!
	/// Banner image. TV size medium resolution (1280x720).
	public var bannerTvMediumImageUrl: String!
	/// The URL for the image that appears above the top-left corner of the video player. This is a 25-pixel-high image with a flexible width that cannot exceed 170 pixels.
	public var watchIconImageUrl: String!
	/// Banner image. Tablet size high resolution (2276x377).
	public var bannerTabletHdImageUrl: String!
	/// The URL for the 854px by 70px image that appears below the video player in the expanded video view of the video watch page.
	public var largeBrandedBannerImageUrl: YoutubeLocalizedProperty!
	/// Banner image. Tablet size (1707x283).
	public var bannerTabletImageUrl: String!
	/// The URL for the background image shown on the video watch page. The image should be 1200px by 615px, with a maximum file size of 128k.
	public var backgroundImageUrl: YoutubeLocalizedProperty!
	/// Banner image. Mobile size high resolution (1280x360).
	public var bannerMobileHdImageUrl: String!
	/// The URL for the 640px by 70px banner image that appears below the video player in the default view of the video watch page.
	public var smallBrandedBannerImageUrl: YoutubeLocalizedProperty!
	/// Banner image. Tablet size low resolution (1138x188).
	public var bannerTabletLowImageUrl: String!
	/// Banner image. TV size high resolution (1920x1080).
	public var bannerTvHighImageUrl: String!
	/// Banner image. Mobile size (640x175).
	public var bannerMobileImageUrl: String!
	/// Banner image. Mobile size medium/high resolution (960x263).
	public var bannerMobileMediumHdImageUrl: String!
	/// The image map script for the large banner image.
	public var largeBrandedBannerImageImapScript: YoutubeLocalizedProperty!
	/// Banner image. Tablet size extra high resolution (2560x424).
	public var bannerTabletExtraHdImageUrl: String!
	/// Banner image. TV size low resolution (854x480).
	public var bannerTvLowImageUrl: String!
	/// This is used only in update requests; if it's set, we use this URL to generate all of the above banner URLs.
	public var bannerExternalUrl: String!
	/// Banner image. TV size extra high resolution (2120x1192).
	public var bannerTvImageUrl: String!
	/// Banner image. Desktop size (1060x175).
	public var bannerImageUrl: String!
	/// The URL for a 1px by 1px tracking pixel that can be used to collect statistics for views of the channel or video pages.
	public var trackingImageUrl: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		bannerMobileExtraHdImageUrl <- map["bannerMobileExtraHdImageUrl"]
		smallBrandedBannerImageImapScript <- map["smallBrandedBannerImageImapScript"]
		bannerMobileLowImageUrl <- map["bannerMobileLowImageUrl"]
		bannerTvMediumImageUrl <- map["bannerTvMediumImageUrl"]
		watchIconImageUrl <- map["watchIconImageUrl"]
		bannerTabletHdImageUrl <- map["bannerTabletHdImageUrl"]
		largeBrandedBannerImageUrl <- map["largeBrandedBannerImageUrl"]
		bannerTabletImageUrl <- map["bannerTabletImageUrl"]
		backgroundImageUrl <- map["backgroundImageUrl"]
		bannerMobileHdImageUrl <- map["bannerMobileHdImageUrl"]
		smallBrandedBannerImageUrl <- map["smallBrandedBannerImageUrl"]
		bannerTabletLowImageUrl <- map["bannerTabletLowImageUrl"]
		bannerTvHighImageUrl <- map["bannerTvHighImageUrl"]
		bannerMobileImageUrl <- map["bannerMobileImageUrl"]
		bannerMobileMediumHdImageUrl <- map["bannerMobileMediumHdImageUrl"]
		largeBrandedBannerImageImapScript <- map["largeBrandedBannerImageImapScript"]
		bannerTabletExtraHdImageUrl <- map["bannerTabletExtraHdImageUrl"]
		bannerTvLowImageUrl <- map["bannerTvLowImageUrl"]
		bannerExternalUrl <- map["bannerExternalUrl"]
		bannerTvImageUrl <- map["bannerTvImageUrl"]
		bannerImageUrl <- map["bannerImageUrl"]
		trackingImageUrl <- map["trackingImageUrl"]
	}
}

