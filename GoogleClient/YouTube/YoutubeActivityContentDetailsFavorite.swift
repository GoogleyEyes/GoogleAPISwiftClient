//
//  YoutubeActivityContentDetailsFavorite.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Information about a video that was marked as a favorite video.
public class YoutubeActivityContentDetailsFavorite: ObjectType {
	/// The resourceId object contains information that identifies the resource that was marked as a favorite.
	public var resourceId: YoutubeResourceId!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		resourceId <- map["resourceId"]
	}
}

