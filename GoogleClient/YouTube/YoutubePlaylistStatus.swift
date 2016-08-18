//
//  YoutubePlaylistStatus.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The PlaylistStatus model type for use with the Youtube API
public class YoutubePlaylistStatus: ObjectType {
	/// The playlist's privacy status.
	public var privacyStatus: YoutubePlaylistStatusPrivacyStatus!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		privacyStatus <- map["privacyStatus"]
	}
}

/// The playlist's privacy status.
public enum YoutubePlaylistStatusPrivacyStatus: String {
	/// 
	case Private = "private"
	/// 
	case Public = "public"
	/// 
	case Unlisted = "unlisted"
}

