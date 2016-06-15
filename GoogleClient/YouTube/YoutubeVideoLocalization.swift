//
//  YoutubeVideoLocalization.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The VideoLocalization model type for use with the Youtube API
public class YoutubeVideoLocalization: ObjectType {
	/// Localized version of the video's title.
	public var title: String!
	/// Localized version of the video's description.
	public var description: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		title <- map["title"]
		description <- map["description"]
	}
}

