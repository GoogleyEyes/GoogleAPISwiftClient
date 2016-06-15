//
//  YoutubeVideoAbuseReportSecondaryReason.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The VideoAbuseReportSecondaryReason model type for use with the Youtube API
public class YoutubeVideoAbuseReportSecondaryReason: ObjectType {
	/// The ID of this abuse report secondary reason.
	public var id: String!
	/// The localized label for this abuse report secondary reason.
	public var label: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		id <- map["id"]
		label <- map["label"]
	}
}

