//
//  YoutubeInvideoPromotion.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Describes an invideo promotion campaign consisting of multiple promoted items. A campaign belongs to a single channel_id.
public class YoutubeInvideoPromotion: ListType {
	/// Indicates whether the channel's promotional campaign uses "smart timing." This feature attempts to show promotions at a point in the video when they are more likely to be clicked and less likely to disrupt the viewing experience. This feature also picks up a single promotion to show on each video.
	public var useSmartTiming: Bool!
	/// The default temporal position within the video where the promoted item will be displayed. Can be overriden by more specific timing in the item.
	public var defaultTiming: YoutubeInvideoTiming!
	/// List of promoted items in decreasing priority.
	public var items: [YoutubePromotedItem]!
	/// The spatial position within the video where the promoted item will be displayed.
	public var position: YoutubeInvideoPosition!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		useSmartTiming <- map["useSmartTiming"]
		defaultTiming <- map["defaultTiming"]
		items <- map["items"]
		position <- map["position"]
	}
	public required init(arrayLiteral elements: YoutubePromotedItem...) {
		items = elements
	}

	public typealias Generator = IndexingGenerator<[YoutubePromotedItem]>

	public func generate() -> Generator {
		let objects = items as [YoutubePromotedItem]
		return objects.generate()
	}

	public subscript(position: Int) -> YoutubePromotedItem {
		return items[position]
	}
}

