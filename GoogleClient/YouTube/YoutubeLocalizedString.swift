//
//  YoutubeLocalizedString.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLocalizedString: Mappable {
	public var language: String!
	public var value: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		language <- map["language"]
		value <- map["value"]
	}
}

