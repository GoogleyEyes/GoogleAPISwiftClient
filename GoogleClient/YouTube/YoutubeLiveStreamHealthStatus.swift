//
//  YoutubeLiveStreamHealthStatus.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLiveStreamHealthStatus: Mappable {
	/// The status code of this stream
	public var status: YoutubeLiveStreamHealthStatusStatus!
	/// The configurations issues on this stream
	public var configurationIssues: [YoutubeLiveStreamConfigurationIssue]!
	/// The last time this status was updated (in seconds)
	public var lastUpdateTimeSeconds: UInt64!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		status <- map["status"]
		configurationIssues <- map["configurationIssues"]
		lastUpdateTimeSeconds <- map["lastUpdateTimeSeconds"]
	}
}

