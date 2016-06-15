//
//  YoutubeInvideoBranding.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The InvideoBranding model type for use with the Youtube API
public class YoutubeInvideoBranding: ObjectType {
	public var imageBytes: URL!
	public var timing: YoutubeInvideoTiming!
	public var imageUrl: String!
	public var position: YoutubeInvideoPosition!
	public var targetChannelId: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		imageBytes <- (map["imageBytes"], URLTransform())
		timing <- map["timing"]
		imageUrl <- map["imageUrl"]
		position <- map["position"]
		targetChannelId <- map["targetChannelId"]
	}
}

