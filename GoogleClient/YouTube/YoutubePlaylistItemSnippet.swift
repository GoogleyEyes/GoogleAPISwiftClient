//
//  YoutubePlaylistItemSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The PlaylistItemSnippet model type for use with the Youtube API
public class YoutubePlaylistItemSnippet: ObjectType {
	/// The ID that YouTube uses to uniquely identify the user that added the item to the playlist.
	public var channelId: String!
	/// A map of thumbnail images associated with the playlist item. For each object in the map, the key is the name of the thumbnail image, and the value is an object that contains other information about the thumbnail.
	public var thumbnails: YoutubeThumbnailDetails!
	/// The item's title.
	public var title: String!
	/// The id object contains information that can be used to uniquely identify the resource that is included in the playlist as the playlist item.
	public var resourceId: YoutubeResourceId!
	/// The ID that YouTube uses to uniquely identify the playlist that the playlist item is in.
	public var playlistId: String!
	/// The item's description.
	public var description: String!
	/// The date and time that the item was added to the playlist. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var publishedAt: NSDate!
	/// The order in which the item appears in the playlist. The value uses a zero-based index, so the first item has a position of 0, the second item has a position of 1, and so forth.
	public var position: UInt!
	/// Channel title for the channel that the playlist item belongs to.
	public var channelTitle: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		channelId <- map["channelId"]
		thumbnails <- map["thumbnails"]
		title <- map["title"]
		resourceId <- map["resourceId"]
		playlistId <- map["playlistId"]
		description <- map["description"]
		publishedAt <- (map["publishedAt"], RFC3339Transform())
		position <- map["position"]
		channelTitle <- map["channelTitle"]
	}
}

