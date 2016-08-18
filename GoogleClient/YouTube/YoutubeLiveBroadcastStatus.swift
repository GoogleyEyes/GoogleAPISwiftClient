//
//  YoutubeLiveBroadcastStatus.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The broadcast's recording status.
public enum YoutubeLiveBroadcastStatusRecordingStatus: String {
	/// 
	case NotRecording = "notRecording"
	/// 
	case Recorded = "recorded"
	/// 
	case Recording = "recording"
}

/// Priority of the live broadcast event (internal state).
public enum YoutubeLiveBroadcastStatusLiveBroadcastPriority: String {
	/// 
	case High = "high"
	/// 
	case Low = "low"
	/// 
	case Normal = "normal"
}

/// The broadcast's privacy status. Note that the broadcast represents exactly one YouTube video, so the privacy settings are identical to those supported for videos. In addition, you can set this field by modifying the broadcast resource or by setting the privacyStatus field of the corresponding video resource.
public enum YoutubeLiveBroadcastStatusPrivacyStatus: String {
	/// 
	case Private = "private"
	/// 
	case Public = "public"
	/// 
	case Unlisted = "unlisted"
}

/// The LiveBroadcastStatus model type for use with the Youtube API
public class YoutubeLiveBroadcastStatus: ObjectType {
	/// The broadcast's status. The status can be updated using the API's liveBroadcasts.transition method.
	public var lifeCycleStatus: YoutubeLiveBroadcastStatusLifeCycleStatus!
	/// Priority of the live broadcast event (internal state).
	public var liveBroadcastPriority: YoutubeLiveBroadcastStatusLiveBroadcastPriority!
	/// The broadcast's privacy status. Note that the broadcast represents exactly one YouTube video, so the privacy settings are identical to those supported for videos. In addition, you can set this field by modifying the broadcast resource or by setting the privacyStatus field of the corresponding video resource.
	public var privacyStatus: YoutubeLiveBroadcastStatusPrivacyStatus!
	/// The broadcast's recording status.
	public var recordingStatus: YoutubeLiveBroadcastStatusRecordingStatus!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		lifeCycleStatus <- map["lifeCycleStatus"]
		liveBroadcastPriority <- map["liveBroadcastPriority"]
		privacyStatus <- map["privacyStatus"]
		recordingStatus <- map["recordingStatus"]
	}
}

/// The broadcast's status. The status can be updated using the API's liveBroadcasts.transition method.
public enum YoutubeLiveBroadcastStatusLifeCycleStatus: String {
	/// 
	case Abandoned = "abandoned"
	/// 
	case Complete = "complete"
	/// 
	case CompleteStarting = "completeStarting"
	/// 
	case Created = "created"
	/// 
	case Live = "live"
	/// 
	case LiveStarting = "liveStarting"
	/// 
	case Ready = "ready"
	/// 
	case Reclaimed = "reclaimed"
	/// 
	case Revoked = "revoked"
	/// 
	case TestStarting = "testStarting"
	/// 
	case Testing = "testing"
}

