//
//  YoutubeInvideoPromotion.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeInvideoPromotion: ListType {
	public typealias `Type` = YoutubePromotedItem
	/// List of promoted items in decreasing priority.
	public var items: [Type]!
	/// Indicates whether the channel's promotional campaign uses "smart timing." This feature attempts to show promotions at a point in the video when they are more likely to be clicked and less likely to disrupt the viewing experience. This feature also picks up a single promotion to show on each video.
	public var useSmartTiming: Bool!
	/// The default temporal position within the video where the promoted item will be displayed. Can be overriden by more specific timing in the item.
	public var defaultTiming: YoutubeInvideoTiming!
	/// The spatial position within the video where the promoted item will be displayed.
	public var position: YoutubeInvideoPosition!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		items <- map["items"]
		useSmartTiming <- map["useSmartTiming"]
		defaultTiming <- map["defaultTiming"]
		position <- map["position"]
	}
	public required init(arrayLiteral elements: Type...) {
		items = elements
	}

	public typealias Iterator = IndexingIterator<[Type]>

	public func makeIterator() -> Iterator {
		let objects = items as [Type]
		return objects.makeIterator()
	}

	public subscript(position: Int) -> Type {
		return items[position]
	}
}

