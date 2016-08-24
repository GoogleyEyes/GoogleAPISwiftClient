//
//  YoutubeActivityContentDetailsSubscription.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Information about a channel that a user subscribed to.
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

