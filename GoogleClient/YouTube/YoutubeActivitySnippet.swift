//
//  YoutubeActivitySnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The type of activity that the resource describes.
public enum YoutubeActivitySnippetType: String {
	/// 
	case Bulletin = "bulletin"
	/// 
	case ChannelItem = "channelItem"
	/// 
	case Comment = "comment"
	/// 
	case Favorite = "favorite"
	/// 
	case Like = "like"
	/// 
	case PlaylistItem = "playlistItem"
	/// 
	case PromotedItem = "promotedItem"
	/// 
	case Recommendation = "recommendation"
	/// 
	case Social = "social"
	/// 
	case Subscription = "subscription"
	/// 
	case Upload = "upload"
}

/// The ActivitySnippet model type for use with the Youtube API
public class YoutubeActivitySnippet: ObjectType {
	/// A map of thumbnail images associated with the resource that is primarily associated with the activity. For each object in the map, the key is the name of the thumbnail image, and the value is an object that contains other information about the thumbnail.
	public var thumbnails: YoutubeThumbnailDetails!
	/// The ID that YouTube uses to uniquely identify the channel associated with the activity.
	public var channelId: String!
	/// The title of the resource primarily associated with the activity.
	public var title: String!
	/// The group ID associated with the activity. A group ID identifies user events that are associated with the same user and resource. For example, if a user rates a video and marks the same video as a favorite, the entries for those events would have the same group ID in the user's activity feed. In your user interface, you can avoid repetition by grouping events with the same groupId value.
	public var groupId: String!
	/// The description of the resource primarily associated with the activity.
	public var description: String!
	/// The date and time that the video was uploaded. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var publishedAt: NSDate!
	/// Channel title for the channel responsible for this activity
	public var channelTitle: String!
	/// The type of activity that the resource describes.
	public var type: YoutubeActivitySnippetType!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		thumbnails <- map["thumbnails"]
		channelId <- map["channelId"]
		title <- map["title"]
		groupId <- map["groupId"]
		description <- map["description"]
		publishedAt <- (map["publishedAt"], RFC3339Transform())
		channelTitle <- map["channelTitle"]
		type <- map["type"]
	}
}

