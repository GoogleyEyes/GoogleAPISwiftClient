//
//  YoutubePromotedItem.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubePromotedItem: Mappable {
	/// The temporal position within the video where the promoted item will be displayed. If present, it overrides the default timing.
	public var timing: YoutubeInvideoTiming!
	/// If true, the content owner's name will be used when displaying the promotion. This field can only be set when the update is made on behalf of the content owner.
	public var promotedByContentOwner: Bool!
	/// Identifies the promoted item.
	public var id: YoutubePromotedItemId!
	/// A custom message to display for this promotion. This field is currently ignored unless the promoted item is a website.
	public var customMessage: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		timing <- map["timing"]
		promotedByContentOwner <- map["promotedByContentOwner"]
		id <- map["id"]
		customMessage <- map["customMessage"]
	}
}

