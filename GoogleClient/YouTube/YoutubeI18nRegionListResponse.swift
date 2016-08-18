//
//  YoutubeI18nRegionListResponse.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The I18nRegionListResponse model type for use with the Youtube API
public class YoutubeI18nRegionListResponse: GoogleObjectList {
	/// The visitorId identifies the visitor.
	public var visitorId: String!
	/// Etag of this resource.
	public var etag: String!
	/// A list of regions where YouTube is available. In this map, the i18n region ID is the map key, and its value is the corresponding i18nRegion resource.
	public var items: [YoutubeI18nRegion]!
	/// Serialized EventId of the request which produced this response.
	public var eventId: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#i18nRegionListResponse".
	public var kind: String = "youtube#i18nRegionListResponse"
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		visitorId <- map["visitorId"]
		etag <- map["etag"]
		items <- map["items"]
		eventId <- map["eventId"]
		kind <- map["kind"]
	}
	public required init(arrayLiteral elements: YoutubeI18nRegion...) {
		items = elements
	}

	public typealias Generator = IndexingGenerator<[YoutubeI18nRegion]>

	public func generate() -> Generator {
		let objects = items as [YoutubeI18nRegion]
		return objects.generate()
	}

	public subscript(position: Int) -> YoutubeI18nRegion {
		return items[position]
	}
}

