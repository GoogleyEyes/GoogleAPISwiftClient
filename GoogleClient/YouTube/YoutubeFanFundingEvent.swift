//
//  YoutubeFanFundingEvent.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeFanFundingEvent: GoogleObject {
	/// The snippet object contains basic details about the fan funding event.
	public var snippet: YoutubeFanFundingEventSnippet!
	/// Etag of this resource.
	public var etag: String!
	/// The ID that YouTube assigns to uniquely identify the fan funding event.
	public var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#fanFundingEvent".
	public var kind: String = "youtube#fanFundingEvent"
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		kind <- map["kind"]
	}
}

