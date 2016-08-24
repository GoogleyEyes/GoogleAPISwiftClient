//
//  YoutubeChannelConversionPings.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The conversionPings object encapsulates information about conversion pings that need to be respected by the channel.
public class YoutubeChannelConversionPings: ObjectType {
	/// Pings that the app shall fire (authenticated by biscotti cookie). Each ping has a context, in which the app must fire the ping, and a url identifying the ping.
	public var pings: [YoutubeChannelConversionPing]!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		pings <- map["pings"]
	}
}

