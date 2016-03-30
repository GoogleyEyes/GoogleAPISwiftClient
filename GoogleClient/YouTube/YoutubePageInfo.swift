//
//  YoutubePageInfo.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubePageInfo: ObjectType {
	/// The number of results included in the API response.
	public var resultsPerPage: Int!
	/// The total number of results in the result set.
	public var totalResults: Int!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		resultsPerPage <- map["resultsPerPage"]
		totalResults <- map["totalResults"]
	}
}

