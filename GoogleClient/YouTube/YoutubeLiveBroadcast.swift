//
//  YoutubeLiveBroadcast.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLiveBroadcast: GoogleObject {
	/// The statistics object contains info about the event's current stats. These include concurrent viewers and total chat count. Statistics can change (in either direction) during the lifetime of an event. Statistics are only returned while the event is live.
	public var statistics: YoutubeLiveBroadcastStatistics!
	public var topicDetails: YoutubeLiveBroadcastTopicDetails!
	/// The ID that YouTube assigns to uniquely identify the broadcast.
	public var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#liveBroadcast".
	public var kind: String = "youtube#liveBroadcast"
	/// The contentDetails object contains information about the event's video content, such as whether the content can be shown in an embedded video player or if it will be archived and therefore available for viewing after the event has concluded.
	public var contentDetails: YoutubeLiveBroadcastContentDetails!
	/// The snippet object contains basic details about the event, including its title, description, start time, and end time.
	public var snippet: YoutubeLiveBroadcastSnippet!
	/// Etag of this resource.
	public var etag: String!
	/// The status object contains information about the event's status.
	public var status: YoutubeLiveBroadcastStatus!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		statistics <- map["statistics"]
		topicDetails <- map["topicDetails"]
		id <- map["id"]
		kind <- map["kind"]
		contentDetails <- map["contentDetails"]
		snippet <- map["snippet"]
		etag <- map["etag"]
		status <- map["status"]
	}
}

