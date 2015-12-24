//
//  YoutubePageInfo.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubePageInfo: Mappable {
	/// The number of results included in the API response.
	public var resultsPerPage: Int!
	/// The total number of results in the result set.
	public var totalResults: Int!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		resultsPerPage <- map["resultsPerPage"]
		totalResults <- map["totalResults"]
	}
}

