//
//  YoutubeChannelSectionContentDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Details about a channelsection, including playlists and channels.
public class YoutubeChannelSectionContentDetails: ObjectType {
	/// The playlist ids for type single_playlist and multiple_playlists. For singlePlaylist, only one playlistId is allowed.
	public var playlists: [String]!
	/// The channel ids for type multiple_channels.
	public var channels: [String]!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		playlists <- map["playlists"]
		channels <- map["channels"]
	}
}

