//
//  YoutubeVideoRating.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public enum YoutubeVideoRatingRating: String {
	case Dislike = "dislike"
	case Like = "like"
	case None = "none"
	case Unspecified = "unspecified"
}

public class YoutubeVideoRating: ObjectType {
	public var rating: YoutubeVideoRatingRating!
	public var videoId: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		rating <- map["rating"]
		videoId <- map["videoId"]
	}
}

