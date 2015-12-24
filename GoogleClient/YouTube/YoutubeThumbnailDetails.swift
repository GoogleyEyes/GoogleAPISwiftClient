//
//  YoutubeThumbnailDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeThumbnailDetails: Mappable {
	/// The medium quality image for this resource.
	public var medium: YoutubeThumbnail!
	/// The default image for this resource.
	public var defaultValue: YoutubeThumbnail!
	/// The maximum resolution quality image for this resource.
	public var maxres: YoutubeThumbnail!
	/// The standard quality image for this resource.
	public var standard: YoutubeThumbnail!
	/// The high quality image for this resource.
	public var high: YoutubeThumbnail!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		medium <- map["medium"]
		defaultValue <- map["default"]
		maxres <- map["maxres"]
		standard <- map["standard"]
		high <- map["high"]
	}
}

