//
//  YoutubePlaylist.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

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

