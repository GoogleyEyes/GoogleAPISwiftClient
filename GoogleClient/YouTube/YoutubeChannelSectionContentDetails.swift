//
//  YoutubeChannelSectionContentDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeChannelSectionContentDetails: Mappable {
	/// The playlist ids for type single_playlist and multiple_playlists. For singlePlaylist, only one playlistId is allowed.
	public var playlists: [String]!
	/// The channel ids for type multiple_channels.
	public var channels: [String]!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		playlists <- map["playlists"]
		channels <- map["channels"]
	}
}

