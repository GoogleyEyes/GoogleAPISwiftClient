//
//  YoutubeLiveChatMessageListResponse.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLiveChatMessageListResponse: GoogleObjectList {
	public typealias Type = YoutubeLiveChatMessage
	/// A list of live chat messages.
	public var items: [Type]!
	public var tokenPagination: YoutubeTokenPagination!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#liveChatMessageListResponse".
	public var kind: String = "youtube#liveChatMessageListResponse"
	/// The token that can be used as the value of the pageToken parameter to retrieve the next page in the result set.
	public var nextPageToken: String!
	public var pageInfo: YoutubePageInfo!
	/// The visitorId identifies the visitor.
	public var visitorId: String!
	/// Etag of this resource.
	public var etag: String!
	/// The date and time when the underlying stream went offline. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var offlineAt: NSDate!
	/// Serialized EventId of the request which produced this response.
	public var eventId: String!
	/// The amount of time the client should wait before polling again.
	public var pollingIntervalMillis: UInt!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		items <- map["items"]
		tokenPagination <- map["tokenPagination"]
		kind <- map["kind"]
		nextPageToken <- map["nextPageToken"]
		pageInfo <- map["pageInfo"]
		visitorId <- map["visitorId"]
		etag <- map["etag"]
		offlineAt <- (map["offlineAt"], RFC3339Transform())
		eventId <- map["eventId"]
		pollingIntervalMillis <- map["pollingIntervalMillis"]
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

