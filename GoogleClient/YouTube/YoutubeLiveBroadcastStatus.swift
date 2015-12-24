//
//  YoutubeLiveBroadcastStatus.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLiveBroadcastStatus: Mappable {
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

	public func mapping(map: Map) {
		lifeCycleStatus <- map["lifeCycleStatus"]
		liveBroadcastPriority <- map["liveBroadcastPriority"]
		privacyStatus <- map["privacyStatus"]
		recordingStatus <- map["recordingStatus"]
	}
}

