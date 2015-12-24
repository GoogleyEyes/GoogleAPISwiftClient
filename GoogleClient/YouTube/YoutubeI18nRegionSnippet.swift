//
//  YoutubeI18nRegionSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeI18nRegionSnippet: Mappable {
	/// The human-readable name of the region.
	public var name: String!
	/// The region code as a 2-letter ISO country code.
	public var gl: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		name <- map["name"]
		gl <- map["gl"]
	}
}

