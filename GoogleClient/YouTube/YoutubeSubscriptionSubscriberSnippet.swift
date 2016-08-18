//
//  YoutubeSubscriptionSubscriberSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Basic details about a subscription's subscriber including title, description, channel ID and thumbnails.
public class YoutubeSubscriptionSubscriberSnippet: ObjectType {
	/// The title of the subscriber.
	public var title: String!
	/// The channel ID of the subscriber.
	public var channelId: String!
	/// Thumbnails for this subscriber.
	public var thumbnails: YoutubeThumbnailDetails!
	/// The description of the subscriber.
	public var description: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		title <- map["title"]
		channelId <- map["channelId"]
		thumbnails <- map["thumbnails"]
		description <- map["description"]
	}
}

