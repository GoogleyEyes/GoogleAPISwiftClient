//
//  YoutubeSponsorSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The SponsorSnippet model type for use with the Youtube API
public class YoutubeSponsorSnippet: ObjectType {
	/// The id of the channel being sponsored.
	public var channelId: String!
	/// Details about the sponsor.
	public var sponsorDetails: YoutubeChannelProfileDetails!
	/// The date and time when the user became a sponsor. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var sponsorSince: NSDate!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		channelId <- map["channelId"]
		sponsorDetails <- map["sponsorDetails"]
		sponsorSince <- (map["sponsorSince"], RFC3339Transform())
	}
}

