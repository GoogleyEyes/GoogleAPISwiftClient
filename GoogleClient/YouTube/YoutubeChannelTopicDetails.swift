//
//  YoutubeChannelTopicDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeChannelTopicDetails: Mappable {
	/// A list of Freebase topic IDs associated with the channel. You can retrieve information about each topic using the Freebase Topic API.
	public var topicIds: [String]!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		topicIds <- map["topicIds"]
	}
}

