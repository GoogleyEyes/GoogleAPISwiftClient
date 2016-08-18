//
//  YoutubeFanFundingEventListResponse.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The FanFundingEventListResponse model type for use with the Youtube API
public class YoutubeFanFundingEventListResponse: GoogleObjectList {
	/// A list of fan funding events that match the request criteria.
	public var items: [YoutubeFanFundingEvent]!
	public var tokenPagination: YoutubeTokenPagination!
	public var pageInfo: YoutubePageInfo!
	/// The token that can be used as the value of the pageToken parameter to retrieve the next page in the result set.
	public var nextPageToken: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#fanFundingEventListResponse".
	public var kind: String = "youtube#fanFundingEventListResponse"
	/// The visitorId identifies the visitor.
	public var visitorId: String!
	/// Etag of this resource.
	public var etag: String!
	/// Serialized EventId of the request which produced this response.
	public var eventId: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		items <- map["items"]
		tokenPagination <- map["tokenPagination"]
		pageInfo <- map["pageInfo"]
		nextPageToken <- map["nextPageToken"]
		kind <- map["kind"]
		visitorId <- map["visitorId"]
		etag <- map["etag"]
		eventId <- map["eventId"]
	}
	public required init(arrayLiteral elements: YoutubeFanFundingEvent...) {
		items = elements
	}

	public typealias Generator = IndexingGenerator<[YoutubeFanFundingEvent]>

	public func generate() -> Generator {
		let objects = items as [YoutubeFanFundingEvent]
		return objects.generate()
	}

	public subscript(position: Int) -> YoutubeFanFundingEvent {
		return items[position]
	}
}

