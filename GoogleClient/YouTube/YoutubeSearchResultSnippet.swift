//
//  YoutubeSearchResultSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public enum YoutubeSearchResultSnippetLiveBroadcastContent: String {
	case Live = "live"
	case None = "none"
	case Upcoming = "upcoming"
}

public class YoutubeSearchResultSnippet: ObjectType {
	/// A map of thumbnail images associated with the search result. For each object in the map, the key is the name of the thumbnail image, and the value is an object that contains other information about the thumbnail.
	public var thumbnails: YoutubeThumbnailDetails!
	/// The value that YouTube uses to uniquely identify the channel that published the resource that the search result identifies.
	public var channelId: String!
	/// The title of the search result.
	public var title: String!
	/// It indicates if the resource (video or channel) has upcoming/active live broadcast content. Or it's "none" if there is not any upcoming/active live broadcasts.
	public var liveBroadcastContent: YoutubeSearchResultSnippetLiveBroadcastContent!
	/// A description of the search result.
	public var description: String!
	/// The creation date and time of the resource that the search result identifies. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var publishedAt: NSDate!
	/// The title of the channel that published the resource that the search result identifies.
	public var channelTitle: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		thumbnails <- map["thumbnails"]
		channelId <- map["channelId"]
		title <- map["title"]
		liveBroadcastContent <- map["liveBroadcastContent"]
		description <- map["description"]
		publishedAt <- (map["publishedAt"], RFC3339Transform())
		channelTitle <- map["channelTitle"]
	}
}

