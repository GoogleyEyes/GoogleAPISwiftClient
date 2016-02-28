//
//  YoutubeI18nLanguageSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeI18nLanguageSnippet: ObjectType {
	/// A short BCP-47 code that uniquely identifies a language.
	public var hl: String!
	/// The human-readable name of the language in the language itself.
	public var name: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		hl <- map["hl"]
		name <- map["name"]
	}
}

