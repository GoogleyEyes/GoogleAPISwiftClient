//
//  YoutubePlaylistLocalization.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubePlaylistLocalization: Mappable {
	/// The localized strings for playlist's title.
	public var title: String!
	/// The localized strings for playlist's description.
	public var description: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		title <- map["title"]
		description <- map["description"]
	}
}

