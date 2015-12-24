//
//  YoutubeChannelSectionSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeChannelSectionSnippet: Mappable {
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

	public func mapping(map: Map) {
		channelId <- map["channelId"]
		style <- map["style"]
		title <- map["title"]
		localized <- map["localized"]
		defaultLanguage <- map["defaultLanguage"]
		position <- map["position"]
		type <- map["type"]
	}
}

