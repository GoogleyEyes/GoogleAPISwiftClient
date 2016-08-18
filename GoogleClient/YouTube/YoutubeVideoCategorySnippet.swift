//
//  YoutubeVideoCategorySnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Basic details about a video category, such as its localized title.
public class YoutubeVideoCategorySnippet: ObjectType {
	public var assignable: Bool!
	/// The YouTube channel that created the video category.
	public var channelId: String = "UCBR8-60-B28hp2BmDPdntcQ"
	/// The video category's title.
	public var title: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		assignable <- map["assignable"]
		channelId <- map["channelId"]
		title <- map["title"]
	}
}

