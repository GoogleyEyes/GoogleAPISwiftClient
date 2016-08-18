//
//  YoutubeActivityContentDetailsPlaylistItem.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Information about a new playlist item.
public class YoutubeActivityContentDetailsPlaylistItem: ObjectType {
	/// The resourceId object contains information about the resource that was added to the playlist.
	public var resourceId: YoutubeResourceId!
	/// The value that YouTube uses to uniquely identify the playlist.
	public var playlistId: String!
	/// ID of the item within the playlist.
	public var playlistItemId: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		resourceId <- map["resourceId"]
		playlistId <- map["playlistId"]
		playlistItemId <- map["playlistItemId"]
	}
}

