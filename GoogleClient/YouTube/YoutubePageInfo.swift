//
//  YoutubePageInfo.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Paging details for lists of resources, including total number of items available and number of resources returned in a single page.
public class YoutubePageInfo: ObjectType {
	/// The number of results included in the API response.
	public var resultsPerPage: Int!
	/// The total number of results in the result set.
	public var totalResults: Int!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		resultsPerPage <- map["resultsPerPage"]
		totalResults <- map["totalResults"]
	}
}

