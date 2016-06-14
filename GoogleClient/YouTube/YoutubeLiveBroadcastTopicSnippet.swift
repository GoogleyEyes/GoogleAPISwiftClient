//
//  YoutubeLiveBroadcastTopicSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveBroadcastTopicSnippet model type for use with the Youtube API
public class YoutubeLiveBroadcastTopicSnippet: ObjectType {
	/// The date at which the topic was released. Filled for types: videoGame
	public var releaseDate: String!
	/// The name of the topic.
	public var name: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		releaseDate <- map["releaseDate"]
		name <- map["name"]
	}
}

