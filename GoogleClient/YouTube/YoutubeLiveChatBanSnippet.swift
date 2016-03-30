//
//  YoutubeLiveChatBanSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public enum YoutubeLiveChatBanSnippetType: String {
	case Permanent = "permanent"
	case Temporary = "temporary"
}

public class YoutubeLiveChatBanSnippet: ObjectType {
	/// The duration of a ban, only filled if the ban has type TEMPORARY.
	public var banDurationSeconds: UInt64!
	/// The chat this ban is pertinent to.
	public var liveChatId: String!
	public var bannedUserDetails: YoutubeChannelProfileDetails!
	/// The type of ban.
	public var type: YoutubeLiveChatBanSnippetType!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		banDurationSeconds <- map["banDurationSeconds"]
		liveChatId <- map["liveChatId"]
		bannedUserDetails <- map["bannedUserDetails"]
		type <- map["type"]
	}
}

