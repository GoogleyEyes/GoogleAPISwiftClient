//
//  YoutubeLiveStreamHealthStatus.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The status code of this stream
public enum YoutubeLiveStreamHealthStatusStatus: String {
	/// 
	case Bad = "bad"
	/// 
	case Good = "good"
	/// 
	case NoData = "noData"
	/// 
	case Ok = "ok"
	/// 
	case Revoked = "revoked"
}

/// The LiveStreamHealthStatus model type for use with the Youtube API
public class YoutubeLiveStreamHealthStatus: ObjectType {
	/// The status code of this stream
	public var status: YoutubeLiveStreamHealthStatusStatus!
	/// The configurations issues on this stream
	public var configurationIssues: [YoutubeLiveStreamConfigurationIssue]!
	/// The last time this status was updated (in seconds)
	public var lastUpdateTimeSeconds: UInt64!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		status <- map["status"]
		configurationIssues <- map["configurationIssues"]
		lastUpdateTimeSeconds <- map["lastUpdateTimeSeconds"]
	}
}

