//
//  YoutubeLiveChatMessageAuthorDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLiveChatMessageAuthorDetails: Mappable {
	/// The channel's URL.
	public var channelUrl: String!
	/// The YouTube channel ID.
	public var channelId: String!
	/// The channels's avatar URL.
	public var profileImageUrl: String!
	/// The channel's display name.
	public var displayName: String!
	/// Whether the author is the owner of the live chat.
	public var isChatOwner: Bool!
	/// Whether the author is a sponsor of the live chat.
	public var isChatSponsor: Bool!
	/// Whether the author's identity has been verified by YouTube.
	public var isVerified: Bool!
	/// Whether the author is a moderator of the live chat.
	public var isChatModerator: Bool!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		channelUrl <- map["channelUrl"]
		channelId <- map["channelId"]
		profileImageUrl <- map["profileImageUrl"]
		displayName <- map["displayName"]
		isChatOwner <- map["isChatOwner"]
		isChatSponsor <- map["isChatSponsor"]
		isVerified <- map["isVerified"]
		isChatModerator <- map["isChatModerator"]
	}
}

