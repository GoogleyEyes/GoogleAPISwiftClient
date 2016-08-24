//
//  YoutubeVideoRating.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// 
public enum YoutubeVideoRatingRating: String {
	/// 
	case Dislike = "dislike"
	/// 
	case Like = "like"
	/// 
	case None = "none"
	/// 
	case Unspecified = "unspecified"
}

/// The VideoRating model type for use with the Youtube API
public class YoutubeVideoRating: ObjectType {
	public var rating: YoutubeVideoRatingRating!
	public var videoId: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		rating <- map["rating"]
		videoId <- map["videoId"]
	}
}

