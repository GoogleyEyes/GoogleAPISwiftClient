//
//  YoutubeChannelId.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeChannelId: Mappable {
	public var value: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		value <- map["value"]
	}
}

