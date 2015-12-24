//
//  YoutubeChannelConversionPings.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeChannelConversionPings: Mappable {
	/// Pings that the app shall fire (authenticated by biscotti cookie). Each ping has a context, in which the app must fire the ping, and a url identifying the ping.
	public var pings: [YoutubeChannelConversionPing]!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		pings <- map["pings"]
	}
}

