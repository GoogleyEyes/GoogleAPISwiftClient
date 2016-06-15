//
//  YoutubeChannelProfileDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ChannelProfileDetails model type for use with the Youtube API
public class YoutubeChannelProfileDetails: ObjectType {
	/// The channel's URL.
	public var channelUrl: String!
	/// The channels's avatar URL.
	public var profileImageUrl: String!
	/// The YouTube channel ID.
	public var channelId: String!
	/// The channel's display name.
	public var displayName: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		channelUrl <- map["channelUrl"]
		profileImageUrl <- map["profileImageUrl"]
		channelId <- map["channelId"]
		displayName <- map["displayName"]
	}
}

