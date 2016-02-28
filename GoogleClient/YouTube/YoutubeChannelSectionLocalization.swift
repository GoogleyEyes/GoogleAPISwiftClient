//
//  YoutubeChannelSectionLocalization.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeChannelSectionLocalization: ObjectType {
	/// The localized strings for channel section's title.
	public var title: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		title <- map["title"]
	}
}

