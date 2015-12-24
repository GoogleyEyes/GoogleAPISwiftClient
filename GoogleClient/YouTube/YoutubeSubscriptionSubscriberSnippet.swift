//
//  YoutubeSubscriptionSubscriberSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeSubscriptionSubscriberSnippet: Mappable {
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

	public func mapping(map: Map) {
		title <- map["title"]
		channelId <- map["channelId"]
		thumbnails <- map["thumbnails"]
		description <- map["description"]
	}
}

