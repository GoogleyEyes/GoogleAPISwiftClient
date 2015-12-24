//
//  YoutubeLiveBroadcastTopic.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLiveBroadcastTopic: Mappable {
	/// Information about the topic matched.
	public var snippet: YoutubeLiveBroadcastTopicSnippet!
	/// If this flag is set it means that we have not been able to match the topic title and type provided to a known entity.
	public var unmatched: Bool!
	/// The type of the topic.
	public var type: YoutubeLiveBroadcastTopicType!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		snippet <- map["snippet"]
		unmatched <- map["unmatched"]
		type <- map["type"]
	}
}

