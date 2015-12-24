//
//  YoutubeLiveChatMessageSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLiveChatMessageSnippet: Mappable {
	/// The type of message, this will always be present, it determines the contents of the message as well as which fields will be present.
	public var type: YoutubeLiveChatMessageSnippetType!
	public var liveChatId: String!
	/// The ID of the user that authored this message, this field is not always filled. textMessageEvent - the user that wrote the message fanFundingEvent - the user that funded the broadcast newSponsorEvent - the user that just became a sponsor
	public var authorChannelId: String!
	/// Details about the funding event, this is only set if the type is 'fanFundingEvent'.
	public var fanFundingEventDetails: YoutubeLiveChatFanFundingEventDetails!
	/// The date and time when the message was orignally published. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var publishedAt: NSDate!
	/// Whether the message has display content that should be displayed to users.
	public var hasDisplayContent: Bool!
	/// Details about the text message, this is only set if the type is 'textMessageEvent'.
	public var textMessageDetails: YoutubeLiveChatTextMessageDetails!
	/// Contains a string that can be displayed to the user. If this field is not present the message is silent, at the moment only messages of type TOMBSTONE and CHAT_ENDED_EVENT are silent.
	public var displayMessage: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		type <- map["type"]
		liveChatId <- map["liveChatId"]
		authorChannelId <- map["authorChannelId"]
		fanFundingEventDetails <- map["fanFundingEventDetails"]
		publishedAt <- (map["publishedAt"], RFC3339Transform())
		hasDisplayContent <- map["hasDisplayContent"]
		textMessageDetails <- map["textMessageDetails"]
		displayMessage <- map["displayMessage"]
	}
}

