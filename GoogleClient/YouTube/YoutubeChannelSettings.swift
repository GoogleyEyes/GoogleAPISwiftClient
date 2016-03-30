//
//  YoutubeChannelSettings.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeChannelSettings: ObjectType {
	/// Whether the tab to browse the videos should be displayed.
	public var showBrowseView: Bool!
	/// Specifies the channel title.
	public var title: String!
	/// Whether related channels should be proposed.
	public var showRelatedChannels: Bool!
	/// The ID for a Google Analytics account to track and measure traffic to the channels.
	public var trackingAnalyticsAccountId: String!
	/// The country of the channel.
	public var country: String!
	/// Specifies the channel description.
	public var description: String!
	/// The list of featured channels.
	public var featuredChannelsUrls: [String]!
	public var defaultLanguage: String!
	/// Lists keywords associated with the channel, comma-separated.
	public var keywords: String!
	/// Whether user-submitted comments left on the channel page need to be approved by the channel owner to be publicly visible.
	public var moderateComments: Bool!
	/// Which content tab users should see when viewing the channel.
	public var defaultTab: String!
	/// A prominent color that can be rendered on this channel page.
	public var profileColor: String!
	/// Title for the featured channels tab.
	public var featuredChannelsTitle: String!
	/// The trailer of the channel, for users that are not subscribers.
	public var unsubscribedTrailer: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		showBrowseView <- map["showBrowseView"]
		title <- map["title"]
		showRelatedChannels <- map["showRelatedChannels"]
		trackingAnalyticsAccountId <- map["trackingAnalyticsAccountId"]
		country <- map["country"]
		description <- map["description"]
		featuredChannelsUrls <- map["featuredChannelsUrls"]
		defaultLanguage <- map["defaultLanguage"]
		keywords <- map["keywords"]
		moderateComments <- map["moderateComments"]
		defaultTab <- map["defaultTab"]
		profileColor <- map["profileColor"]
		featuredChannelsTitle <- map["featuredChannelsTitle"]
		unsubscribedTrailer <- map["unsubscribedTrailer"]
	}
}

