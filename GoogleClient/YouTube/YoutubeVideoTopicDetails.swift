//
//  YoutubeVideoTopicDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Freebase topic information related to the video.
public class YoutubeVideoTopicDetails: ObjectType {
	/// A list of Freebase topic IDs that are centrally associated with the video. These are topics that are centrally featured in the video, and it can be said that the video is mainly about each of these. You can retrieve information about each topic using the Freebase Topic API.
	public var topicIds: [String]!
	/// Similar to topic_id, except that these topics are merely relevant to the video. These are topics that may be mentioned in, or appear in the video. You can retrieve information about each topic using Freebase Topic API.
	public var relevantTopicIds: [String]!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		topicIds <- map["topicIds"]
		relevantTopicIds <- map["relevantTopicIds"]
	}
}

