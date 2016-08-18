//
//  YoutubeLocalizedProperty.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LocalizedProperty model type for use with the Youtube API
public class YoutubeLocalizedProperty: ObjectType {
	public var localized: [YoutubeLocalizedString]!
	public var defaultValue: String!
	/// The language of the default property.
	public var defaultLanguage: YoutubeLanguageTag!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		localized <- map["localized"]
		defaultValue <- map["default"]
		defaultLanguage <- map["defaultLanguage"]
	}
}

