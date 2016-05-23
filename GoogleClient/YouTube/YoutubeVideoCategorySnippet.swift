//
//  YoutubeVideoCategorySnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The VideoCategorySnippet model type for use with the Youtube API
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

