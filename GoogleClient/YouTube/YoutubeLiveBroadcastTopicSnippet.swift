//
//  YoutubeLiveBroadcastTopicSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLiveBroadcastTopicSnippet: ObjectType {
	/// The date at which the topic was released. Filled for types: videoGame
	public var releaseDate: String!
	/// The name of the topic.
	public var name: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		releaseDate <- map["releaseDate"]
		name <- map["name"]
	}
}

