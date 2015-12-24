//
//  YoutubeSponsorSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeSponsorSnippet: Mappable {
	/// The id of the channel being sponsored.
	public var channelId: String!
	/// Details about the sponsor.
	public var sponsorDetails: YoutubeChannelProfileDetails!
	/// The date and time when the user became a sponsor. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var sponsorSince: NSDate!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		channelId <- map["channelId"]
		sponsorDetails <- map["sponsorDetails"]
		sponsorSince <- (map["sponsorSince"], RFC3339Transform())
	}
}

