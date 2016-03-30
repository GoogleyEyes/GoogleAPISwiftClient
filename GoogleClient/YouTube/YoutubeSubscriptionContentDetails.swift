//
//  YoutubeSubscriptionContentDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public enum YoutubeSubscriptionContentDetailsActivityType: String {
	case All = "all"
	case Uploads = "uploads"
}

public class YoutubeSubscriptionContentDetails: ObjectType {
	/// The approximate number of items that the subscription points to.
	public var totalItemCount: UInt!
	/// The type of activity this subscription is for (only uploads, everything).
	public var activityType: YoutubeSubscriptionContentDetailsActivityType!
	/// The number of new items in the subscription since its content was last read.
	public var newItemCount: UInt!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		totalItemCount <- map["totalItemCount"]
		activityType <- map["activityType"]
		newItemCount <- map["newItemCount"]
	}
}

