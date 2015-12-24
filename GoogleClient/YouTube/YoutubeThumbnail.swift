//
//  YoutubeThumbnail.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeThumbnail: Mappable {
	/// (Optional) Width of the thumbnail image.
	public var width: UInt!
	/// (Optional) Height of the thumbnail image.
	public var height: UInt!
	/// The thumbnail image's URL.
	public var url: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		width <- map["width"]
		height <- map["height"]
		url <- map["url"]
	}
}

