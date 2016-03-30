//
//  YoutubeLiveBroadcastTopic.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public enum YoutubeLiveBroadcastTopicType: String {
	case VideoGame = "videoGame"
}

public class YoutubeLiveBroadcastTopic: ObjectType {
	/// Information about the topic matched.
	public var snippet: YoutubeLiveBroadcastTopicSnippet!
	/// If this flag is set it means that we have not been able to match the topic title and type provided to a known entity.
	public var unmatched: Bool!
	/// The type of the topic.
	public var type: YoutubeLiveBroadcastTopicType!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		snippet <- map["snippet"]
		unmatched <- map["unmatched"]
		type <- map["type"]
	}
}

