//
//  YoutubePlaylistItem.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubePlaylistItem: GoogleObject {
	/// The contentDetails object is included in the resource if the included item is a YouTube video. The object contains additional information about the video.
	public var contentDetails: YoutubePlaylistItemContentDetails!
	/// The snippet object contains basic details about the playlist item, such as its title and position in the playlist.
	public var snippet: YoutubePlaylistItemSnippet!
	/// Etag of this resource.
	public var etag: String!
	/// The ID that YouTube uses to uniquely identify the playlist item.
	public var id: String!
	/// The status object contains information about the playlist item's privacy status.
	public var status: YoutubePlaylistItemStatus!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#playlistItem".
	public var kind: String = "youtube#playlistItem"
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		contentDetails <- map["contentDetails"]
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		status <- map["status"]
		kind <- map["kind"]
	}
}

