//
//  YoutubeLiveBroadcastTopicDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLiveBroadcastTopicDetails: Mappable {
	public var topics: [YoutubeLiveBroadcastTopic]!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		topics <- map["topics"]
	}
}

