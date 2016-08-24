//
//  YoutubeMonitorStreamInfo.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Settings and Info of the monitor stream
public class YoutubeMonitorStreamInfo: ObjectType {
	/// If you have set the enableMonitorStream property to true, then this property determines the length of the live broadcast delay.
	public var broadcastStreamDelayMs: UInt!
	/// HTML code that embeds a player that plays the monitor stream.
	public var embedHtml: String!
	/**
	This value determines whether the monitor stream is enabled for the broadcast. If the monitor stream is enabled, then YouTube will broadcast the event content on a special stream intended only for the broadcaster's consumption. The broadcaster can use the stream to review the event content and also to identify the optimal times to insert cuepoints.
	
	You need to set this value to true if you intend to have a broadcast delay for your event.
	
	Note: This property cannot be updated once the broadcast is in the testing or live state.*/
	public var enableMonitorStream: Bool!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		broadcastStreamDelayMs <- map["broadcastStreamDelayMs"]
		embedHtml <- map["embedHtml"]
		enableMonitorStream <- map["enableMonitorStream"]
	}
}

