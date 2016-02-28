//
//  YoutubeChannelStatus.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public enum YoutubeChannelStatusPrivacyStatus: String {
	case Private = "private"
	case Public = "public"
	case Unlisted = "unlisted"
}

public class YoutubeChannelStatus: ObjectType {
	/// If true, then the user is linked to either a YouTube username or G+ account. Otherwise, the user doesn't have a public YouTube identity.
	public var isLinked: Bool!
	/// Privacy status of the channel.
	public var privacyStatus: YoutubeChannelStatusPrivacyStatus!
	/// The long uploads status of this channel. See
	public var longUploadsStatus: YoutubeChannelStatusLongUploadsStatus!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		isLinked <- map["isLinked"]
		privacyStatus <- map["privacyStatus"]
		longUploadsStatus <- map["longUploadsStatus"]
	}
}

public enum YoutubeChannelStatusLongUploadsStatus: String {
	case Allowed = "allowed"
	case Disallowed = "disallowed"
	case Eligible = "eligible"
	case LongUploadsUnspecified = "longUploadsUnspecified"
}

