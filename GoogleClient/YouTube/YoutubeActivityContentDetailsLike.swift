//
//  YoutubeActivityContentDetailsLike.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Information about a resource that received a positive (like) rating.
public class YoutubeActivityContentDetailsLike: ObjectType {
	/// The resourceId object contains information that identifies the rated resource.
	public var resourceId: YoutubeResourceId!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		resourceId <- map["resourceId"]
	}
}

