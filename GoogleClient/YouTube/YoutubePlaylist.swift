//
//  YoutubePlaylist.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/**
	A playlist resource represents a YouTube playlist. A playlist is a collection of videos that can be viewed sequentially and shared with other users. A playlist can contain up to 200 videos, and YouTube does not limit the number of playlists that each user creates. By default, playlists are publicly visible to other users, but playlists can be public or private.
	
	YouTube also uses playlists to identify special collections of videos for a channel, such as:  
	- uploaded videos 
	- favorite videos 
	- positively rated (liked) videos 
	- watch history 
	- watch later  To be more specific, these lists are associated with a channel, which is a collection of a person, group, or company's videos, playlists, and other YouTube information. You can retrieve the playlist IDs for each of these lists from the  channel resource for a given channel.
	
	You can then use the   playlistItems.list method to retrieve any of those lists. You can also add or remove items from those lists by calling the   playlistItems.insert and   playlistItems.delete methods.*/
public class YoutubePlaylist: GoogleObject {
	/// The ID that YouTube uses to uniquely identify the playlist.
	public var id: String!
	/// The player object contains information that you would use to play the playlist in an embedded player.
	public var player: YoutubePlaylistPlayer!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#playlist".
	public var kind: String = "youtube#playlist"
	/// The contentDetails object contains information like video count.
	public var contentDetails: YoutubePlaylistContentDetails!
	/// Localizations for different languages
	public var localizations: [String: YoutubePlaylistLocalization]!
	/// The snippet object contains basic details about the playlist, such as its title and description.
	public var snippet: YoutubePlaylistSnippet!
	/// Etag of this resource.
	public var etag: String!
	/// The status object contains status information for the playlist.
	public var status: YoutubePlaylistStatus!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		id <- map["id"]
		player <- map["player"]
		kind <- map["kind"]
		contentDetails <- map["contentDetails"]
		localizations <- map["localizations"]
		snippet <- map["snippet"]
		etag <- map["etag"]
		status <- map["status"]
	}
}

