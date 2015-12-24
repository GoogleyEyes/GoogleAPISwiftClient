//
//  YoutubeLiveChatBanSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLiveChatBanSnippet: Mappable {
	/// The duration of a ban, only filled if the ban has type TEMPORARY.
	public var banDurationSeconds: UInt64!
	/// The chat this ban is pertinent to.
	public var liveChatId: String!
	public var bannedUserDetails: YoutubeChannelProfileDetails!
	/// The type of ban.
	public var type: YoutubeLiveChatBanSnippetType!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		banDurationSeconds <- map["banDurationSeconds"]
		liveChatId <- map["liveChatId"]
		bannedUserDetails <- map["bannedUserDetails"]
		type <- map["type"]
	}
}

