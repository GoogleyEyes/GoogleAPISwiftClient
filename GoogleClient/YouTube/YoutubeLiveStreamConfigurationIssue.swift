//
//  YoutubeLiveStreamConfigurationIssue.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLiveStreamConfigurationIssue: Mappable {
	/// The short-form reason for this issue.
	public var reason: String!
	/// The long-form description of the issue and how to resolve it.
	public var description: String!
	/// How severe this issue is to the stream.
	public var severity: YoutubeLiveStreamConfigurationIssueSeverity!
	/// The kind of error happening.
	public var type: YoutubeLiveStreamConfigurationIssueType!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		reason <- map["reason"]
		description <- map["description"]
		severity <- map["severity"]
		type <- map["type"]
	}
}

