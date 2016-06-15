//
//  YoutubeThumbnail.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The Thumbnail model type for use with the Youtube API
public class YoutubeThumbnail: ObjectType {
	/// (Optional) Width of the thumbnail image.
	public var width: UInt!
	/// (Optional) Height of the thumbnail image.
	public var height: UInt!
	/// The thumbnail image's URL.
	public var url: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		width <- map["width"]
		height <- map["height"]
		url <- map["url"]
	}
}

