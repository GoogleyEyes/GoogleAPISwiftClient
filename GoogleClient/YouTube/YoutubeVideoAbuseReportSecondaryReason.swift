//
//  YoutubeVideoAbuseReportSecondaryReason.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeVideoAbuseReportSecondaryReason: Mappable {
	/// The ID of this abuse report secondary reason.
	public var id: String!
	/// The localized label for this abuse report secondary reason.
	public var label: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		id <- map["id"]
		label <- map["label"]
	}
}

