//
//  YoutubeChannelContentDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeChannelContentDetailsRelatedPlaylists: ObjectType {
	/// The ID of the playlist that contains the channel"s uploaded videos. Use the  videos.insert method to upload new videos and the videos.delete method to delete previously uploaded videos.
	public var uploads: String!
	/// The ID of the playlist that contains the channel"s watch later playlist. Use the playlistItems.insert and  playlistItems.delete to add or remove items from that list.
	public var watchLater: String!
	/// The ID of the playlist that contains the channel"s watch history. Use the  playlistItems.insert and  playlistItems.delete to add or remove items from that list.
	public var watchHistory: String!
	/// The ID of the playlist that contains the channel"s liked videos. Use the   playlistItems.insert and  playlistItems.delete to add or remove items from that list.
	public var likes: String!
	/// The ID of the playlist that contains the channel"s favorite videos. Use the  playlistItems.insert and  playlistItems.delete to add or remove items from that list.
	public var favorites: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		uploads <- map["uploads"]
		watchLater <- map["watchLater"]
		watchHistory <- map["watchHistory"]
		likes <- map["likes"]
		favorites <- map["favorites"]
	}
}

public class YoutubeChannelContentDetails: ObjectType {
	public var relatedPlaylists: YoutubeChannelContentDetailsRelatedPlaylists!
	/// The googlePlusUserId object identifies the Google+ profile ID associated with this channel.
	public var googlePlusUserId: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		relatedPlaylists <- map["relatedPlaylists"]
		googlePlusUserId <- map["googlePlusUserId"]
	}
}

