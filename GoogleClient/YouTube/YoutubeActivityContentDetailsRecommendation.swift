//
//  YoutubeActivityContentDetailsRecommendation.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The reason that the resource is recommended to the user.
public enum YoutubeActivityContentDetailsRecommendationReason: String {
	/// 
	case Unspecified = "unspecified"
	/// 
	case VideoFavorited = "videoFavorited"
	/// 
	case VideoLiked = "videoLiked"
	/// 
	case VideoWatched = "videoWatched"
}

/// Information that identifies the recommended resource.
public class YoutubeActivityContentDetailsRecommendation: ObjectType {
	/// The resourceId object contains information that identifies the recommended resource.
	public var resourceId: YoutubeResourceId!
	/// The seedResourceId object contains information about the resource that caused the recommendation.
	public var seedResourceId: YoutubeResourceId!
	/// The reason that the resource is recommended to the user.
	public var reason: YoutubeActivityContentDetailsRecommendationReason!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		resourceId <- map["resourceId"]
		seedResourceId <- map["seedResourceId"]
		reason <- map["reason"]
	}
}

