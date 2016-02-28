//
//  YoutubeFanFundingEventSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeFanFundingEventSnippet: ObjectType {
	/// Channel id where the funding event occurred.
	public var channelId: String!
	/// The text contents of the comment left by the user.
	public var commentText: String!
	/// The currency in which the fund was made. ISO 4217.
	public var currency: String!
	/// A rendered string that displays the fund amount and currency (e.g., "$1.00"). The string is rendered for the given language.
	public var displayString: String!
	/// Details about the supporter. Only filled if the event was made public by the user.
	public var supporterDetails: YoutubeChannelProfileDetails!
	/// The amount of funding in micros of fund_currency. e.g., 1 is represented
	public var amountMicros: UInt64!
	/// The date and time when the funding occurred. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var createdAt: NSDate!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		channelId <- map["channelId"]
		commentText <- map["commentText"]
		currency <- map["currency"]
		displayString <- map["displayString"]
		supporterDetails <- map["supporterDetails"]
		amountMicros <- map["amountMicros"]
		createdAt <- (map["createdAt"], RFC3339Transform())
	}
}

