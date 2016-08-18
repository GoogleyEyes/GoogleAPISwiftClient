//
//  YoutubeVideoSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Indicates if the video is an upcoming/active live broadcast. Or it's "none" if the video is not an upcoming/active live broadcast.
public enum YoutubeVideoSnippetLiveBroadcastContent: String {
	/// 
	case Live = "live"
	/// 
	case None = "none"
	/// 
	case Upcoming = "upcoming"
}

/// Basic details about a video, including title, description, uploader, thumbnails and category.
public class YoutubeVideoSnippet: ObjectType {
	/// The ID that YouTube uses to uniquely identify the channel that the video was uploaded to.
	public var channelId: String!
	/// A list of keyword tags associated with the video. Tags may contain spaces.
	public var tags: [String]!
	/// Indicates if the video is an upcoming/active live broadcast. Or it's "none" if the video is not an upcoming/active live broadcast.
	public var liveBroadcastContent: YoutubeVideoSnippetLiveBroadcastContent!
	/// The video's title.
	public var title: String!
	/// The default_audio_language property specifies the language spoken in the video's default audio track.
	public var defaultAudioLanguage: String!
	/// A map of thumbnail images associated with the video. For each object in the map, the key is the name of the thumbnail image, and the value is an object that contains other information about the thumbnail.
	public var thumbnails: YoutubeThumbnailDetails!
	/// Localized snippet selected with the hl parameter. If no such localization exists, this field is populated with the default snippet. (Read-only)
	public var localized: YoutubeVideoLocalization!
	/// The video's description.
	public var description: String!
	/// The YouTube video category associated with the video.
	public var categoryId: String!
	/// The date and time that the video was uploaded. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var publishedAt: NSDate!
	/// The language of the videos's default snippet.
	public var defaultLanguage: String!
	/// Channel title for the channel that the video belongs to.
	public var channelTitle: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		channelId <- map["channelId"]
		tags <- map["tags"]
		liveBroadcastContent <- map["liveBroadcastContent"]
		title <- map["title"]
		defaultAudioLanguage <- map["defaultAudioLanguage"]
		thumbnails <- map["thumbnails"]
		localized <- map["localized"]
		description <- map["description"]
		categoryId <- map["categoryId"]
		publishedAt <- (map["publishedAt"], RFC3339Transform())
		defaultLanguage <- map["defaultLanguage"]
		channelTitle <- map["channelTitle"]
	}
}

