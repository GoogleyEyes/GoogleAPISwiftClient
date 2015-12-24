//
//  YoutubeVideoCategorySnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeVideoCategorySnippet: Mappable {
	public var assignable: Bool!
	/// The YouTube channel that created the video category.
	public var channelId: String = "UCBR8-60-B28hp2BmDPdntcQ"
	/// The video category's title.
	public var title: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		assignable <- map["assignable"]
		channelId <- map["channelId"]
		title <- map["title"]
	}
}

