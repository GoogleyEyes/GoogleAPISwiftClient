//
//  YoutubeActivityContentDetailsSubscription.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeActivityContentDetailsSubscription: Mappable {
	/// The resourceId object contains information that identifies the resource that the user subscribed to.
	public var resourceId: YoutubeResourceId!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		resourceId <- map["resourceId"]
	}
}

