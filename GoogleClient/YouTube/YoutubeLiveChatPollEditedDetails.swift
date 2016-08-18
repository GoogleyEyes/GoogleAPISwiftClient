//
//  YoutubeLiveChatPollEditedDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveChatPollEditedDetails model type for use with the Youtube API
public class YoutubeLiveChatPollEditedDetails: ListType {
	public var id: String!
	public var items: [YoutubeLiveChatPollItem]!
	public var prompt: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		id <- map["id"]
		items <- map["items"]
		prompt <- map["prompt"]
	}
	public required init(arrayLiteral elements: YoutubeLiveChatPollItem...) {
		items = elements
	}

	public typealias Generator = IndexingGenerator<[YoutubeLiveChatPollItem]>

	public func generate() -> Generator {
		let objects = items as [YoutubeLiveChatPollItem]
		return objects.generate()
	}

	public subscript(position: Int) -> YoutubeLiveChatPollItem {
		return items[position]
	}
}

