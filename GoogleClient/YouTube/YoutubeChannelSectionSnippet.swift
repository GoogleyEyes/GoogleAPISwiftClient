//
//  YoutubeChannelSectionSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The type of the channel section.
public enum YoutubeChannelSectionSnippetType: String {
	/// 
	case AllPlaylists = "allPlaylists"
	/// 
	case ChannelsectionTypeUndefined = "channelsectionTypeUndefined"
	/// 
	case CompletedEvents = "completedEvents"
	/// 
	case LikedPlaylists = "likedPlaylists"
	/// 
	case Likes = "likes"
	/// 
	case LiveEvents = "liveEvents"
	/// 
	case MultipleChannels = "multipleChannels"
	/// 
	case MultiplePlaylists = "multiplePlaylists"
	/// 
	case PopularUploads = "popularUploads"
	/// 
	case PostedPlaylists = "postedPlaylists"
	/// 
	case PostedVideos = "postedVideos"
	/// 
	case RecentActivity = "recentActivity"
	/// 
	case RecentPosts = "recentPosts"
	/// 
	case RecentUploads = "recentUploads"
	/// 
	case SinglePlaylist = "singlePlaylist"
	/// 
	case Subscriptions = "subscriptions"
	/// 
	case UpcomingEvents = "upcomingEvents"
}

/// The style of the channel section.
public enum YoutubeChannelSectionSnippetStyle: String {
	/// 
	case ChannelsectionStyleUndefined = "channelsectionStyleUndefined"
	/// 
	case HorizontalRow = "horizontalRow"
	/// 
	case VerticalList = "verticalList"
}

/// The ChannelSectionSnippet model type for use with the Youtube API
public class YoutubeChannelSectionSnippet: ObjectType {
	/// The ID that YouTube uses to uniquely identify the channel that published the channel section.
	public var channelId: String!
	/// The style of the channel section.
	public var style: YoutubeChannelSectionSnippetStyle!
	/// The channel section's title for multiple_playlists and multiple_channels.
	public var title: String!
	/// Localized title, read-only.
	public var localized: YoutubeChannelSectionLocalization!
	/// The language of the channel section's default title and description.
	public var defaultLanguage: String!
	/// The position of the channel section in the channel.
	public var position: UInt!
	/// The type of the channel section.
	public var type: YoutubeChannelSectionSnippetType!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		channelId <- map["channelId"]
		style <- map["style"]
		title <- map["title"]
		localized <- map["localized"]
		defaultLanguage <- map["defaultLanguage"]
		position <- map["position"]
		type <- map["type"]
	}
}

