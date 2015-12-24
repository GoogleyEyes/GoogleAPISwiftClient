//
//  YoutubeLocalizedProperty.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLocalizedProperty: Mappable {
	public var localized: [YoutubeLocalizedString]!
	public var defaultValue: String!
	/// The language of the default property.
	public var defaultLanguage: YoutubeLanguageTag!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		localized <- map["localized"]
		defaultValue <- map["default"]
		defaultLanguage <- map["defaultLanguage"]
	}
}

