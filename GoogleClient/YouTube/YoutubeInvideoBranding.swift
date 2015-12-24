//
//  YoutubeInvideoBranding.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeInvideoBranding: Mappable {
	public var imageBytes: NSURL!
	public var timing: YoutubeInvideoTiming!
	public var imageUrl: String!
	public var position: YoutubeInvideoPosition!
	public var targetChannelId: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		imageBytes <- (map["imageBytes"], URLTransform())
		timing <- map["timing"]
		imageUrl <- map["imageUrl"]
		position <- map["position"]
		targetChannelId <- map["targetChannelId"]
	}
}

