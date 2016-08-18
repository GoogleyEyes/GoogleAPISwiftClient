//
//  YoutubeThumbnailSetResponse.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ThumbnailSetResponse model type for use with the Youtube API
public class YoutubeThumbnailSetResponse: GoogleObjectList {
	/// The visitorId identifies the visitor.
	public var visitorId: String!
	/// Etag of this resource.
	public var etag: String!
	/// A list of thumbnails.
	public var items: [YoutubeThumbnailDetails]!
	/// Serialized EventId of the request which produced this response.
	public var eventId: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#thumbnailSetResponse".
	public var kind: String = "youtube#thumbnailSetResponse"
	
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
	public required init(arrayLiteral elements: YoutubeThumbnailDetails...) {
		items = elements
	}

	public typealias Generator = IndexingGenerator<[YoutubeThumbnailDetails]>

	public func generate() -> Generator {
		let objects = items as [YoutubeThumbnailDetails]
		return objects.generate()
	}

	public subscript(position: Int) -> YoutubeThumbnailDetails {
		return items[position]
	}
}

