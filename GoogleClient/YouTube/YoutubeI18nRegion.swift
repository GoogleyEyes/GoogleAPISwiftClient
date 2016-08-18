//
//  YoutubeI18nRegion.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// A i18nRegion resource identifies a region where YouTube is available.
public class YoutubeI18nRegion: GoogleObject {
	/// The snippet object contains basic details about the i18n region, such as region code and human-readable name.
	public var snippet: YoutubeI18nRegionSnippet!
	/// Etag of this resource.
	public var etag: String!
	/// The ID that YouTube uses to uniquely identify the i18n region.
	public var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#i18nRegion".
	public var kind: String = "youtube#i18nRegion"
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		kind <- map["kind"]
	}
}

