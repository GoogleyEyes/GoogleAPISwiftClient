//
//  YoutubePlaylistItemStatus.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubePlaylistItemStatus: ObjectType {
	/// This resource's privacy status.
	public var privacyStatus: YoutubePlaylistItemStatusPrivacyStatus!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		privacyStatus <- map["privacyStatus"]
	}
}

public enum YoutubePlaylistItemStatusPrivacyStatus: String {
	case Private = "private"
	case Public = "public"
	case Unlisted = "unlisted"
}

