//
//  YoutubeSubscription.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The Subscription model type for use with the Youtube API
public class YoutubeSubscription: GoogleObject {
	/// The contentDetails object contains basic statistics about the subscription.
	public var contentDetails: YoutubeSubscriptionContentDetails!
	/// The snippet object contains basic details about the subscription, including its title and the channel that the user subscribed to.
	public var snippet: YoutubeSubscriptionSnippet!
	/// Etag of this resource.
	public var etag: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#subscription".
	public var kind: String = "youtube#subscription"
	/// The ID that YouTube uses to uniquely identify the subscription.
	public var id: String!
	/// The subscriberSnippet object contains basic details about the sbuscriber.
	public var subscriberSnippet: YoutubeSubscriptionSubscriberSnippet!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		contentDetails <- map["contentDetails"]
		snippet <- map["snippet"]
		etag <- map["etag"]
		kind <- map["kind"]
		id <- map["id"]
		subscriberSnippet <- map["subscriberSnippet"]
	}
}

