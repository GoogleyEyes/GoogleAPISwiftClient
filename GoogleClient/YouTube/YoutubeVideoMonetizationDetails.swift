//
//  YoutubeVideoMonetizationDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeVideoMonetizationDetails: ObjectType {
	/// The value of access indicates whether the video can be monetized or not.
	public var access: YoutubeAccessPolicy!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		access <- map["access"]
	}
}

