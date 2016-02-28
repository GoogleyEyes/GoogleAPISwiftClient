//
//  YoutubePlaylistContentDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubePlaylistContentDetails: ObjectType {
	/// The number of videos in the playlist.
	public var itemCount: UInt!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		itemCount <- map["itemCount"]
	}
}

