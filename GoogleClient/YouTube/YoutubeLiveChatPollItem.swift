//
//  YoutubeLiveChatPollItem.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveChatPollItem model type for use with the Youtube API
public class YoutubeLiveChatPollItem: ObjectType {
	public var itemId: String!
	/// Plain text description of the item.
	public var description: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		itemId <- map["itemId"]
		description <- map["description"]
	}
}

