//
//  YoutubeChannelSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeChannelSnippet: Mappable {
	/// A map of thumbnail images associated with the channel. For each object in the map, the key is the name of the thumbnail image, and the value is an object that contains other information about the thumbnail.
	public var thumbnails: YoutubeThumbnailDetails!
	/// The channel's title.
	public var title: String!
	/// The country of the channel.
	public var country: String!
	/// Localized title and description, read-only.
	public var localized: YoutubeChannelLocalization!
	/// The description of the channel.
	public var description: String!
	/// The date and time that the channel was created. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var publishedAt: NSDate!
	/// The language of the channel's default title and description.
	public var defaultLanguage: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		thumbnails <- map["thumbnails"]
		title <- map["title"]
		country <- map["country"]
		localized <- map["localized"]
		description <- map["description"]
		publishedAt <- (map["publishedAt"], RFC3339Transform())
		defaultLanguage <- map["defaultLanguage"]
	}
}

