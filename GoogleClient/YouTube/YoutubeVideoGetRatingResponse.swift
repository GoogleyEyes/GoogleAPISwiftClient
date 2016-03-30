//
//  YoutubeVideoGetRatingResponse.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeVideoGetRatingResponse: GoogleObjectList {
	public typealias Type = YoutubeVideoRating
	/// A list of ratings that match the request criteria.
	public var items: [Type]!
	/// The visitorId identifies the visitor.
	public var visitorId: String!
	/// Etag of this resource.
	public var etag: String!
	/// Serialized EventId of the request which produced this response.
	public var eventId: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#videoGetRatingResponse".
	public var kind: String = "youtube#videoGetRatingResponse"
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		items <- map["items"]
		visitorId <- map["visitorId"]
		etag <- map["etag"]
		eventId <- map["eventId"]
		kind <- map["kind"]
	}
	public required init(arrayLiteral elements: Type...) {
		items = elements
	}

	public typealias Generator = IndexingGenerator<[Type]>

	public func generate() -> Generator {
		let objects = items as [Type]
		return objects.generate()
	}

	public subscript(position: Int) -> Type {
		return items[position]
	}
}

