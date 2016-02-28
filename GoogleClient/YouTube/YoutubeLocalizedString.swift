//
//  YoutubeLocalizedString.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLocalizedString: ObjectType {
	public var language: String!
	public var value: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		language <- map["language"]
		value <- map["value"]
	}
}

