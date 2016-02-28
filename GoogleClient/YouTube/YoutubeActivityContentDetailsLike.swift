//
//  YoutubeActivityContentDetailsLike.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeActivityContentDetailsLike: ObjectType {
	/// The resourceId object contains information that identifies the rated resource.
	public var resourceId: YoutubeResourceId!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		resourceId <- map["resourceId"]
	}
}

