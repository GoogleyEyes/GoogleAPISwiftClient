//
//  YoutubeActivityContentDetailsRecommendation.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeActivityContentDetailsRecommendation: Mappable {
	/// The resourceId object contains information that identifies the recommended resource.
	public var resourceId: YoutubeResourceId!
	/// The seedResourceId object contains information about the resource that caused the recommendation.
	public var seedResourceId: YoutubeResourceId!
	/// The reason that the resource is recommended to the user.
	public var reason: YoutubeActivityContentDetailsRecommendationReason!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		resourceId <- map["resourceId"]
		seedResourceId <- map["seedResourceId"]
		reason <- map["reason"]
	}
}

