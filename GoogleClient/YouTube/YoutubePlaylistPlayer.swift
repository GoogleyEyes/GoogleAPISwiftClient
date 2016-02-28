//
//  YoutubePlaylistPlayer.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubePlaylistPlayer: ObjectType {
	/// An <iframe> tag that embeds a player that will play the playlist.
	public var embedHtml: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		embedHtml <- map["embedHtml"]
	}
}

