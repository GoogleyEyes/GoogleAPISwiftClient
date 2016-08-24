//
//  YoutubeLocalizedString.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LocalizedString model type for use with the Youtube API
public class YoutubeLocalizedString: ObjectType {
	public var language: String!
	public var value: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		language <- map["language"]
		value <- map["value"]
	}
}

