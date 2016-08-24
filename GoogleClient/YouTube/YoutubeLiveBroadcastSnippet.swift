//
//  YoutubeLiveBroadcastSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveBroadcastSnippet model type for use with the Youtube API
public class YoutubeLiveBroadcastSnippet: ObjectType {
	/// The ID that YouTube uses to uniquely identify the channel that is publishing the broadcast.
	public var channelId: String!
	/// A map of thumbnail images associated with the broadcast. For each nested object in this object, the key is the name of the thumbnail image, and the value is an object that contains other information about the thumbnail.
	public var thumbnails: YoutubeThumbnailDetails!
	/// The broadcast's title. Note that the broadcast represents exactly one YouTube video. You can set this field by modifying the broadcast resource or by setting the title field of the corresponding video resource.
	public var title: String!
	/// The id of the live chat for this broadcast.
	public var liveChatId: String!
	/// The date and time that the broadcast is scheduled to start. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var scheduledStartTime: Date!
	/// The broadcast's description. As with the title, you can set this field by modifying the broadcast resource or by setting the description field of the corresponding video resource.
	public var description: String!
	/// The date and time that the broadcast actually ended. This information is only available once the broadcast's state is complete. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var actualEndTime: Date!
	public var isDefaultBroadcast: Bool!
	/// The date and time that the broadcast actually started. This information is only available once the broadcast's state is live. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var actualStartTime: Date!
	/// The date and time that the broadcast was added to YouTube's live broadcast schedule. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var publishedAt: Date!
	/// The date and time that the broadcast is scheduled to end. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var scheduledEndTime: Date!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		channelId <- map["channelId"]
		thumbnails <- map["thumbnails"]
		title <- map["title"]
		liveChatId <- map["liveChatId"]
		scheduledStartTime <- (map["scheduledStartTime"], RFC3339Transform())
		description <- map["description"]
		actualEndTime <- (map["actualEndTime"], RFC3339Transform())
		isDefaultBroadcast <- map["isDefaultBroadcast"]
		actualStartTime <- (map["actualStartTime"], RFC3339Transform())
		publishedAt <- (map["publishedAt"], RFC3339Transform())
		scheduledEndTime <- (map["scheduledEndTime"], RFC3339Transform())
	}
}

