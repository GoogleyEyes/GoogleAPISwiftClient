//
//  YoutubeVideoContentDetailsRegionRestriction.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeVideoContentDetailsRegionRestriction: Mappable {
	/// A list of region codes that identify countries where the video is blocked. If this property is present and a country is not listed in its value, then the video is viewable in that country. If this property is present and contains an empty list, the video is viewable in all countries.
	public var blocked: [String]!
	/// A list of region codes that identify countries where the video is viewable. If this property is present and a country is not listed in its value, then the video is blocked from appearing in that country. If this property is present and contains an empty list, the video is blocked in all countries.
	public var allowed: [String]!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		blocked <- map["blocked"]
		allowed <- map["allowed"]
	}
}

