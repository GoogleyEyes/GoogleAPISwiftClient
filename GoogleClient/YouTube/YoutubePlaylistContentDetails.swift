//
//  YoutubePlaylistContentDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubePlaylistContentDetails: Mappable {
	/// The number of videos in the playlist.
	public var itemCount: UInt!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		itemCount <- map["itemCount"]
	}
}

