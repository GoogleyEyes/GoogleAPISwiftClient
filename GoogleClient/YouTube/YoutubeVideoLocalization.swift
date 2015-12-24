//
//  YoutubeVideoLocalization.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeVideoLocalization: Mappable {
	/// Localized version of the video's title.
	public var title: String!
	/// Localized version of the video's description.
	public var description: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		title <- map["title"]
		description <- map["description"]
	}
}

