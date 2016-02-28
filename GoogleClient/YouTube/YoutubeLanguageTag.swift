//
//  YoutubeLanguageTag.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLanguageTag: ObjectType {
	public var value: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		value <- map["value"]
	}
}

