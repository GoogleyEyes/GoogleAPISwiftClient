//
//  YoutubeLiveChatMessageRetractedDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveChatMessageRetractedDetails model type for use with the Youtube API
public class YoutubeLiveChatMessageRetractedDetails: ObjectType {
	public var retractedMessageId: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		retractedMessageId <- map["retractedMessageId"]
	}
}

