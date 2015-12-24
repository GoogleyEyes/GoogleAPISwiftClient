//
//  YoutubeLiveStreamStatus.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLiveStreamStatus: Mappable {
	/// The health status of the stream.
	public var healthStatus: YoutubeLiveStreamHealthStatus!
	public var streamStatus: YoutubeLiveStreamStatusStreamStatus!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		healthStatus <- map["healthStatus"]
		streamStatus <- map["streamStatus"]
	}
}

