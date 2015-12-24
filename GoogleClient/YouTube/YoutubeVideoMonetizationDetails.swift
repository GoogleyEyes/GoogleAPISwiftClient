//
//  YoutubeVideoMonetizationDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeVideoMonetizationDetails: Mappable {
	/// The value of access indicates whether the video can be monetized or not.
	public var access: YoutubeAccessPolicy!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		access <- map["access"]
	}
}

