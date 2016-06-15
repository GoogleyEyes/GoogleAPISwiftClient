//
//  YoutubeSubscriptionSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The SubscriptionSnippet model type for use with the Youtube API
public class YoutubeSubscriptionSnippet: ObjectType {
	/// A map of thumbnail images associated with the video. For each object in the map, the key is the name of the thumbnail image, and the value is an object that contains other information about the thumbnail.
	public var thumbnails: YoutubeThumbnailDetails!
	/// The ID that YouTube uses to uniquely identify the subscriber's channel.
	public var channelId: String!
	/// The subscription's title.
	public var title: String!
	/// The id object contains information about the channel that the user subscribed to.
	public var resourceId: YoutubeResourceId!
	/// The subscription's details.
	public var description: String!
	/// The date and time that the subscription was created. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var publishedAt: Date!
	/// Channel title for the channel that the subscription belongs to.
	public var channelTitle: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		thumbnails <- map["thumbnails"]
		channelId <- map["channelId"]
		title <- map["title"]
		resourceId <- map["resourceId"]
		description <- map["description"]
		publishedAt <- (map["publishedAt"], RFC3339Transform())
		channelTitle <- map["channelTitle"]
	}
}

