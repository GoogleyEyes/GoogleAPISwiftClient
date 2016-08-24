//
//  YoutubeGuideCategorySnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Basic details about a guide category.
public class YoutubeGuideCategorySnippet: ObjectType {
	public var channelId: String = "UCBR8-60-B28hp2BmDPdntcQ"
	/// Description of the guide category.
	public var title: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		channelId <- map["channelId"]
		title <- map["title"]
	}
}

