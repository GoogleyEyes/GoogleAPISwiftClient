//
//  YoutubeChannelSectionListResponse.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ChannelSectionListResponse model type for use with the Youtube API
public class YoutubeChannelSectionListResponse: GoogleObjectList {
	/// The visitorId identifies the visitor.
	public var visitorId: String!
	/// Etag of this resource.
	public var etag: String!
	/// A list of ChannelSections that match the request criteria.
	public var items: [YoutubeChannelSection]!
	/// Serialized EventId of the request which produced this response.
	public var eventId: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#channelSectionListResponse".
	public var kind: String = "youtube#channelSectionListResponse"
	
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
	public required init(arrayLiteral elements: YoutubeChannelSection...) {
		items = elements
	}

	public typealias Generator = IndexingGenerator<[YoutubeChannelSection]>

	public func generate() -> Generator {
		let objects = items as [YoutubeChannelSection]
		return objects.generate()
	}

	public subscript(position: Int) -> YoutubeChannelSection {
		return items[position]
	}
}

