//
//  YoutubeVideoPlayer.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Player to be used for a video playback.
public class YoutubeVideoPlayer: ObjectType {
	/// An <iframe> tag that embeds a player that will play the video.
	public var embedHtml: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		embedHtml <- map["embedHtml"]
	}
}

