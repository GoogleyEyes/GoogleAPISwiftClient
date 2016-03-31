//
//  YoutubeChannelContentOwnerDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/31/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeChannelContentOwnerDetails: ObjectType {
	/// The date and time of when the channel was linked to the content owner. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var timeLinked: NSDate!
	/// The ID of the content owner linked to the channel.
	public var contentOwner: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		timeLinked <- (map["timeLinked"], RFC3339Transform())
		contentOwner <- map["contentOwner"]
	}
}

