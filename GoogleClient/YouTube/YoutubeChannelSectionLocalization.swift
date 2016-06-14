//
//  YoutubeChannelSectionLocalization.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ChannelSectionLocalization model type for use with the Youtube API
public class YoutubeChannelSectionLocalization: ObjectType {
	/// The localized strings for channel section's title.
	public var title: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		title <- map["title"]
	}
}

