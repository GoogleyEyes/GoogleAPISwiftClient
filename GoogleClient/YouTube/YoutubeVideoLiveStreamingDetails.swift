//
//  YoutubeVideoLiveStreamingDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The VideoLiveStreamingDetails model type for use with the Youtube API
public class YoutubeVideoLiveStreamingDetails: ObjectType {
	/// The time that the broadcast actually ended. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format. This value will not be available until the broadcast is over.
	public var actualEndTime: NSDate!
	/// The ID of the currently active live chat attached to this video. This field is filled only if the video is a currently live broadcast that has live chat. Once the broadcast transitions to complete this field will be removed and the live chat closed down. For persistent broadcasts that live chat id will no longer be tied to this video but rather to the new video being displayed at the persistent page.
	public var activeLiveChatId: String!
	/// The time that the broadcast actually started. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format. This value will not be available until the broadcast begins.
	public var actualStartTime: NSDate!
	/// The time that the broadcast is scheduled to begin. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var scheduledStartTime: NSDate!
	/// The time that the broadcast is scheduled to end. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format. If the value is empty or the property is not present, then the broadcast is scheduled to continue indefinitely.
	public var scheduledEndTime: NSDate!
	/// The number of viewers currently watching the broadcast. The property and its value will be present if the broadcast has current viewers and the broadcast owner has not hidden the viewcount for the video. Note that YouTube stops tracking the number of concurrent viewers for a broadcast when the broadcast ends. So, this property would not identify the number of viewers watching an archived video of a live broadcast that already ended.
	public var concurrentViewers: UInt64!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		actualEndTime <- (map["actualEndTime"], RFC3339Transform())
		activeLiveChatId <- map["activeLiveChatId"]
		actualStartTime <- (map["actualStartTime"], RFC3339Transform())
		scheduledStartTime <- (map["scheduledStartTime"], RFC3339Transform())
		scheduledEndTime <- (map["scheduledEndTime"], RFC3339Transform())
		concurrentViewers <- map["concurrentViewers"]
	}
}

