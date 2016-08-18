//
//  YoutubePlaylistContentDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The PlaylistContentDetails model type for use with the Youtube API
public class YoutubePlaylistContentDetails: ObjectType {
	/// The number of videos in the playlist.
	public var itemCount: UInt!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		itemCount <- map["itemCount"]
	}
}

