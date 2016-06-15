//
//  YoutubeLiveChatTextMessageDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveChatTextMessageDetails model type for use with the Youtube API
public class YoutubeLiveChatTextMessageDetails: ObjectType {
	/// The user's message.
	public var messageText: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		messageText <- map["messageText"]
	}
}

