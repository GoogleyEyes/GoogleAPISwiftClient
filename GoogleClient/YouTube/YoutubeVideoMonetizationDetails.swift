//
//  YoutubeVideoMonetizationDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Details about monetization of a YouTube Video.
public class YoutubeVideoMonetizationDetails: ObjectType {
	/// The value of access indicates whether the video can be monetized or not.
	public var access: YoutubeAccessPolicy!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		access <- map["access"]
	}
}

