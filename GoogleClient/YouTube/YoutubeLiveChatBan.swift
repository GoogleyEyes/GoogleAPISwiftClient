//
//  YoutubeLiveChatBan.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// A liveChatBan resource represents a ban for a YouTube live chat.
public class YoutubeLiveChatBan: GoogleObject {
	/// The snippet object contains basic details about the ban.
	public var snippet: YoutubeLiveChatBanSnippet!
	/// Etag of this resource.
	public var etag: String!
	/// The ID that YouTube assigns to uniquely identify the ban.
	public var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#liveChatBan".
	public var kind: String = "youtube#liveChatBan"
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		kind <- map["kind"]
	}
}

