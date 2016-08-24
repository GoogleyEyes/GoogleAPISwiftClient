//
//  YoutubeLiveStream.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// A live stream describes a live ingestion point.
public class YoutubeLiveStream: GoogleObject {
	/// The ID that YouTube assigns to uniquely identify the stream.
	public var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#liveStream".
	public var kind: String = "youtube#liveStream"
	/// The content_details object contains information about the stream, including the closed captions ingestion URL.
	public var contentDetails: YoutubeLiveStreamContentDetails!
	/// The snippet object contains basic details about the stream, including its channel, title, and description.
	public var snippet: YoutubeLiveStreamSnippet!
	/// Etag of this resource.
	public var etag: String!
	/// The status object contains information about live stream's status.
	public var status: YoutubeLiveStreamStatus!
	/// The cdn object defines the live stream's content delivery network (CDN) settings. These settings provide details about the manner in which you stream your content to YouTube.
	public var cdn: YoutubeCdnSettings!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		id <- map["id"]
		kind <- map["kind"]
		contentDetails <- map["contentDetails"]
		snippet <- map["snippet"]
		etag <- map["etag"]
		status <- map["status"]
		cdn <- map["cdn"]
	}
}

