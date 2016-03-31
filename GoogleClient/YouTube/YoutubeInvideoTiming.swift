//
//  YoutubeInvideoTiming.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/31/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeInvideoTiming: ObjectType {
	/// Defines the duration in milliseconds for which the promotion should be displayed. If missing, the client should use the default.
	public var durationMs: UInt64!
	/// Defines the time at which the promotion will appear. Depending on the value of type the value of the offsetMs field will represent a time offset from the start or from the end of the video, expressed in milliseconds.
	public var offsetMs: UInt64!
	/// Describes a timing type. If the value is offsetFromStart, then the offsetMs field represents an offset from the start of the video. If the value is offsetFromEnd, then the offsetMs field represents an offset from the end of the video.
	public var type: YoutubeInvideoTimingType!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		durationMs <- map["durationMs"]
		offsetMs <- map["offsetMs"]
		type <- map["type"]
	}
}

public enum YoutubeInvideoTimingType: String {
	case OffsetFromEnd = "offsetFromEnd"
	case OffsetFromStart = "offsetFromStart"
}

