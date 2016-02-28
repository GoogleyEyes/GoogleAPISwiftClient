//
//  YoutubeLiveChatModerator.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLiveChatModerator: GoogleObject {
	/// The snippet object contains basic details about the moderator.
	public var snippet: YoutubeLiveChatModeratorSnippet!
	/// Etag of this resource.
	public var etag: String!
	/// The ID that YouTube assigns to uniquely identify the moderator.
	public var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#liveChatModerator".
	public var kind: String = "youtube#liveChatModerator"
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		kind <- map["kind"]
	}
}

