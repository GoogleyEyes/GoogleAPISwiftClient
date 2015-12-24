//
//  YoutubeVideoRating.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeVideoRating: Mappable {
	public var rating: YoutubeVideoRatingRating!
	public var videoId: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		rating <- map["rating"]
		videoId <- map["videoId"]
	}
}

