//
//  YoutubeChannelStatus.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Privacy status of the channel.
public enum YoutubeChannelStatusPrivacyStatus: String {
	/// 
	case Private = "private"
	/// 
	case Public = "public"
	/// 
	case Unlisted = "unlisted"
}

/// The ChannelStatus model type for use with the Youtube API
public class YoutubeChannelStatus: ObjectType {
	/// If true, then the user is linked to either a YouTube username or G+ account. Otherwise, the user doesn't have a public YouTube identity.
	public var isLinked: Bool!
	/// Privacy status of the channel.
	public var privacyStatus: YoutubeChannelStatusPrivacyStatus!
	/// The long uploads status of this channel. See
	public var longUploadsStatus: YoutubeChannelStatusLongUploadsStatus!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		isLinked <- map["isLinked"]
		privacyStatus <- map["privacyStatus"]
		longUploadsStatus <- map["longUploadsStatus"]
	}
}

/// The long uploads status of this channel. See
public enum YoutubeChannelStatusLongUploadsStatus: String {
	/// 
	case Allowed = "allowed"
	/// 
	case Disallowed = "disallowed"
	/// 
	case Eligible = "eligible"
	/// 
	case LongUploadsUnspecified = "longUploadsUnspecified"
}

