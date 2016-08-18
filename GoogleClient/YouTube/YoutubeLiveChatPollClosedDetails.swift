//
//  YoutubeLiveChatPollClosedDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveChatPollClosedDetails model type for use with the Youtube API
public class YoutubeLiveChatPollClosedDetails: ObjectType {
	/// The id of the poll that was closed.
	public var pollId: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		pollId <- map["pollId"]
	}
}

