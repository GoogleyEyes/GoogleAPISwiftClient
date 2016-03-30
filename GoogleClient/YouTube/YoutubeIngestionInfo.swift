//
//  YoutubeIngestionInfo.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeIngestionInfo: ObjectType {
	/// The backup ingestion URL that you should use to stream video to YouTube. You have the option of simultaneously streaming the content that you are sending to the ingestionAddress to this URL.
	public var backupIngestionAddress: String!
	/**
	The primary ingestion URL that you should use to stream video to YouTube. You must stream video to this URL.
	
	Depending on which application or tool you use to encode your video stream, you may need to enter the stream URL and stream name separately or you may need to concatenate them in the following format:
	
	STREAM_URL/STREAM_NAME*/
	public var ingestionAddress: String!
	/// The HTTP or RTMP stream name that YouTube assigns to the video stream.
	public var streamName: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		backupIngestionAddress <- map["backupIngestionAddress"]
		ingestionAddress <- map["ingestionAddress"]
		streamName <- map["streamName"]
	}
}

