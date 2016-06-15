//
//  YoutubeActivityContentDetailsFavorite.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ActivityContentDetailsFavorite model type for use with the Youtube API
public class YoutubeActivityContentDetailsFavorite: ObjectType {
	/// The resourceId object contains information that identifies the resource that was marked as a favorite.
	public var resourceId: YoutubeResourceId!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		resourceId <- map["resourceId"]
	}
}

