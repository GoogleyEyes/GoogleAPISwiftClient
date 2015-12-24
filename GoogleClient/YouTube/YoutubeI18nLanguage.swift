//
//  YoutubeI18nLanguage.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeI18nLanguage: GoogleObject {
	/// The snippet object contains basic details about the i18n language, such as language code and human-readable name.
	public var snippet: YoutubeI18nLanguageSnippet!
	/// Etag of this resource.
	public var etag: String!
	/// The ID that YouTube uses to uniquely identify the i18n language.
	public var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#i18nLanguage".
	public var kind: String = "youtube#i18nLanguage"
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		kind <- map["kind"]
	}
}

