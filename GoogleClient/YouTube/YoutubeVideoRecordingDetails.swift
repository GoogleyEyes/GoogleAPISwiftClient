//
//  YoutubeVideoRecordingDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Recording information associated with the video.
public class YoutubeVideoRecordingDetails: ObjectType {
	/// The geolocation information associated with the video.
	public var location: YoutubeGeoPoint!
	/// The date and time when the video was recorded. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sssZ) format.
	public var recordingDate: NSDate!
	/// The text description of the location where the video was recorded.
	public var locationDescription: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		location <- map["location"]
		recordingDate <- (map["recordingDate"], RFC3339Transform())
		locationDescription <- map["locationDescription"]
	}
}

