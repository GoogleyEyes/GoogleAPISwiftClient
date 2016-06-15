//
//  YoutubeActivityContentDetailsSubscription.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ActivityContentDetailsSubscription model type for use with the Youtube API
public class YoutubeActivityContentDetailsSubscription: ObjectType {
	/// The resourceId object contains information that identifies the resource that the user subscribed to.
	public var resourceId: YoutubeResourceId!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		resourceId <- map["resourceId"]
	}
}

