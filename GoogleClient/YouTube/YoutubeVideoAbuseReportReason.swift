//
//  YoutubeVideoAbuseReportReason.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// A videoAbuseReportReason resource identifies a reason that a video could be reported as abusive. Video abuse report reasons are used with video.ReportAbuse.
public class YoutubeVideoAbuseReportReason: GoogleObject {
	/// The snippet object contains basic details about the abuse report reason.
	public var snippet: YoutubeVideoAbuseReportReasonSnippet!
	/// Etag of this resource.
	public var etag: String!
	/// The ID of this abuse report reason.
	public var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#videoAbuseReportReason".
	public var kind: String = "youtube#videoAbuseReportReason"
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		kind <- map["kind"]
	}
}

