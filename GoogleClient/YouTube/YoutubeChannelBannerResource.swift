//
//  YoutubeChannelBannerResource.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeChannelBannerResource: GoogleObject {
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#channelBannerResource".
	public var kind: String = "youtube#channelBannerResource"
	/// The URL of this banner image.
	public var url: String!
	/// Etag of this resource.
	public var etag: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		kind <- map["kind"]
		url <- map["url"]
		etag <- map["etag"]
	}
}

