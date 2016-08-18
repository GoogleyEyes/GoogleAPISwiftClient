//
//  YoutubeLiveChatPollVotedDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveChatPollVotedDetails model type for use with the Youtube API
public class YoutubeLiveChatPollVotedDetails: ObjectType {
	/// The poll the user voted on.
	public var pollId: String!
	/// The poll item the user chose.
	public var itemId: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		pollId <- map["pollId"]
		itemId <- map["itemId"]
	}
}

