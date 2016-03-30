//
//  YoutubeLiveChatTextMessageDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLiveChatTextMessageDetails: ObjectType {
	/// The user's message.
	public var messageText: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		messageText <- map["messageText"]
	}
}

