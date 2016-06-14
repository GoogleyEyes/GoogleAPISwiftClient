//
//  YoutubeVideoMonetizationDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The VideoMonetizationDetails model type for use with the Youtube API
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

