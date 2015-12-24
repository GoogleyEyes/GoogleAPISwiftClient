//
//  YoutubeVideoAbuseReport.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeVideoAbuseReport: Mappable {
	/// The high-level, or primary, reason that the content is abusive. The value is an abuse report reason ID.
	public var reasonId: String!
	/// The ID that YouTube uses to uniquely identify the video.
	public var videoId: String!
	/// The specific, or secondary, reason that this content is abusive (if available). The value is an abuse report reason ID that is a valid secondary reason for the primary reason.
	public var secondaryReasonId: String!
	/// The language that the content was viewed in.
	public var language: String!
	/// Additional comments regarding the abuse report.
	public var comments: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		reasonId <- map["reasonId"]
		videoId <- map["videoId"]
		secondaryReasonId <- map["secondaryReasonId"]
		language <- map["language"]
		comments <- map["comments"]
	}
}

