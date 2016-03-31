//
//  YoutubeVideoLocalization.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/31/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeVideoLocalization: ObjectType {
	/// Localized version of the video's title.
	public var title: String!
	/// Localized version of the video's description.
	public var description: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		title <- map["title"]
		description <- map["description"]
	}
}

