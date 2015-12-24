//
//  YoutubeChannelSectionTargeting.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeChannelSectionTargeting: Mappable {
	/// The country the channel section is targeting.
	public var countries: [String]!
	/// The language the channel section is targeting.
	public var languages: [String]!
	/// The region the channel section is targeting.
	public var regions: [String]!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		countries <- map["countries"]
		languages <- map["languages"]
		regions <- map["regions"]
	}
}

