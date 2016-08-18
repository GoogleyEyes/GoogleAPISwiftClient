//
//  YoutubeVideoAbuseReportReasonListResponse.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The VideoAbuseReportReasonListResponse model type for use with the Youtube API
public class YoutubeVideoAbuseReportReasonListResponse: GoogleObjectList {
	/// The visitorId identifies the visitor.
	public var visitorId: String!
	/// Etag of this resource.
	public var etag: String!
	/// A list of valid abuse reasons that are used with video.ReportAbuse.
	public var items: [YoutubeVideoAbuseReportReason]!
	/// Serialized EventId of the request which produced this response.
	public var eventId: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#videoAbuseReportReasonListResponse".
	public var kind: String = "youtube#videoAbuseReportReasonListResponse"
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		visitorId <- map["visitorId"]
		etag <- map["etag"]
		items <- map["items"]
		eventId <- map["eventId"]
		kind <- map["kind"]
	}
	public required init(arrayLiteral elements: YoutubeVideoAbuseReportReason...) {
		items = elements
	}

	public typealias Generator = IndexingGenerator<[YoutubeVideoAbuseReportReason]>

	public func generate() -> Generator {
		let objects = items as [YoutubeVideoAbuseReportReason]
		return objects.generate()
	}

	public subscript(position: Int) -> YoutubeVideoAbuseReportReason {
		return items[position]
	}
}

