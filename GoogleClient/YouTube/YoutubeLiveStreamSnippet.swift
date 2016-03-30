//
//  YoutubeLiveStreamSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLiveStreamSnippet: ObjectType {
	/// The stream's title. The value must be between 1 and 128 characters long.
	public var title: String!
	/// The ID that YouTube uses to uniquely identify the channel that is transmitting the stream.
	public var channelId: String!
	/// The date and time that the stream was created. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var publishedAt: NSDate!
	public var isDefaultStream: Bool!
	/// The stream's description. The value cannot be longer than 10000 characters.
	public var description: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		title <- map["title"]
		channelId <- map["channelId"]
		publishedAt <- (map["publishedAt"], RFC3339Transform())
		isDefaultStream <- map["isDefaultStream"]
		description <- map["description"]
	}
}

