//
//  YoutubeLiveChatTextMessageDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLiveChatTextMessageDetails: Mappable {
	/// The user's message.
	public var messageText: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		messageText <- map["messageText"]
	}
}

