//
//  YoutubePlaylistPlayer.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubePlaylistPlayer: Mappable {
	/// An <iframe> tag that embeds a player that will play the playlist.
	public var embedHtml: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		embedHtml <- map["embedHtml"]
	}
}

