//
//  YoutubeGuideCategorySnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The GuideCategorySnippet model type for use with the Youtube API
public class YoutubeGuideCategorySnippet: ObjectType {
	public var channelId: String = "UCBR8-60-B28hp2BmDPdntcQ"
	/// Description of the guide category.
	public var title: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		channelId <- map["channelId"]
		title <- map["title"]
	}
}

