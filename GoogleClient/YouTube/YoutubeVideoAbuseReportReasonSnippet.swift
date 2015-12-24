//
//  YoutubeVideoAbuseReportReasonSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeVideoAbuseReportReasonSnippet: Mappable {
	/// The localized label belonging to this abuse report reason.
	public var label: String!
	/// The secondary reasons associated with this reason, if any are available. (There might be 0 or more.)
	public var secondaryReasons: [YoutubeVideoAbuseReportSecondaryReason]!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		label <- map["label"]
		secondaryReasons <- map["secondaryReasons"]
	}
}

