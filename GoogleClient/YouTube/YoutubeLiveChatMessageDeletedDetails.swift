//
//  YoutubeLiveChatMessageDeletedDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveChatMessageDeletedDetails model type for use with the Youtube API
public class YoutubeLiveChatMessageDeletedDetails: ObjectType {
	public var deletedMessageId: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		deletedMessageId <- map["deletedMessageId"]
	}
}

