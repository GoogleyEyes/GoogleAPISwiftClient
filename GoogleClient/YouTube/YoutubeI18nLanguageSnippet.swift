//
//  YoutubeI18nLanguageSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Basic details about an i18n language, such as language code and human-readable name.
public class YoutubeI18nLanguageSnippet: ObjectType {
	/// A short BCP-47 code that uniquely identifies a language.
	public var hl: String!
	/// The human-readable name of the language in the language itself.
	public var name: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		hl <- map["hl"]
		name <- map["name"]
	}
}

