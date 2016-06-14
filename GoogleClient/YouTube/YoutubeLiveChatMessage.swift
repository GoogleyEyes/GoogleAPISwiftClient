//
//  YoutubeLiveChatMessage.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveChatMessage model type for use with the Youtube API
public class YoutubeLiveChatMessage: GoogleObject {
	/// The snippet object contains basic details about the message.
	public var snippet: YoutubeLiveChatMessageSnippet!
	/// Etag of this resource.
	public var etag: String!
	/// The ID that YouTube assigns to uniquely identify the message.
	public var id: String!
	/// The authorDetails object contains basic details about the user that posted this message.
	public var authorDetails: YoutubeLiveChatMessageAuthorDetails!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#liveChatMessage".
	public var kind: String = "youtube#liveChatMessage"
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		authorDetails <- map["authorDetails"]
		kind <- map["kind"]
	}
}

