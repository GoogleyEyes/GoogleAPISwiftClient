//
//  YoutubeSubscriptionContentDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeSubscriptionContentDetails: Mappable {
	/// The approximate number of items that the subscription points to.
	public var totalItemCount: UInt!
	/// The type of activity this subscription is for (only uploads, everything).
	public var activityType: YoutubeSubscriptionContentDetailsActivityType!
	/// The number of new items in the subscription since its content was last read.
	public var newItemCount: UInt!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		totalItemCount <- map["totalItemCount"]
		activityType <- map["activityType"]
		newItemCount <- map["newItemCount"]
	}
}

