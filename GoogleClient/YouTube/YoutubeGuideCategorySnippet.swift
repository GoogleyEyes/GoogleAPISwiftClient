//
//  YoutubeGuideCategorySnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeGuideCategorySnippet: Mappable {
	public var channelId: String = "UCBR8-60-B28hp2BmDPdntcQ"
	/// Description of the guide category.
	public var title: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		channelId <- map["channelId"]
		title <- map["title"]
	}
}

