//
//  YoutubeI18nRegionSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeI18nRegionSnippet: ObjectType {
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

