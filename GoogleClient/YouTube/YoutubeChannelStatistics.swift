//
//  YoutubeChannelStatistics.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeChannelStatistics: Mappable {
	/// The number of subscribers that the channel has.
	public var subscriberCount: UInt64!
	/// The number of times the channel has been viewed.
	public var viewCount: UInt64!
	/// Whether or not the number of subscribers is shown for this user.
	public var hiddenSubscriberCount: Bool!
	/// The number of videos uploaded to the channel.
	public var videoCount: UInt64!
	/// The number of comments for the channel.
	public var commentCount: UInt64!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		subscriberCount <- map["subscriberCount"]
		viewCount <- map["viewCount"]
		hiddenSubscriberCount <- map["hiddenSubscriberCount"]
		videoCount <- map["videoCount"]
		commentCount <- map["commentCount"]
	}
}

