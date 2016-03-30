//
//  YoutubeVideoAbuseReportReason.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

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

