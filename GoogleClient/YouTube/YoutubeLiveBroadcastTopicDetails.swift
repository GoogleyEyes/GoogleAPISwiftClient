//
//  YoutubeLiveBroadcastTopicDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/31/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLiveBroadcastTopicDetails: ObjectType {
	public var topics: [YoutubeLiveBroadcastTopic]!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		topics <- map["topics"]
	}
}

