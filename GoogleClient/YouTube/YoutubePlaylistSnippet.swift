//
//  YoutubePlaylistSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The PlaylistSnippet model type for use with the Youtube API
public class YoutubePlaylistSnippet: ObjectType {
	/// A map of thumbnail images associated with the playlist. For each object in the map, the key is the name of the thumbnail image, and the value is an object that contains other information about the thumbnail.
	public var thumbnails: YoutubeThumbnailDetails!
	/// The ID that YouTube uses to uniquely identify the channel that published the playlist.
	public var channelId: String!
	/// The playlist's title.
	public var title: String!
	/// Keyword tags associated with the playlist.
	public var tags: [String]!
	/// Localized title and description, read-only.
	public var localized: YoutubePlaylistLocalization!
	/// The playlist's description.
	public var description: String!
	/// The date and time that the playlist was created. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var publishedAt: Date!
	/// The language of the playlist's default title and description.
	public var defaultLanguage: String!
	/// The channel title of the channel that the video belongs to.
	public var channelTitle: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		thumbnails <- map["thumbnails"]
		channelId <- map["channelId"]
		title <- map["title"]
		tags <- map["tags"]
		localized <- map["localized"]
		description <- map["description"]
		publishedAt <- (map["publishedAt"], RFC3339Transform())
		defaultLanguage <- map["defaultLanguage"]
		channelTitle <- map["channelTitle"]
	}
}

