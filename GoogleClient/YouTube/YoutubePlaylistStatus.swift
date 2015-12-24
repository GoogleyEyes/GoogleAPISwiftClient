//
//  YoutubePlaylistStatus.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubePlaylistStatus: Mappable {
	/// The playlist's privacy status.
	public var privacyStatus: YoutubePlaylistStatusPrivacyStatus!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		privacyStatus <- map["privacyStatus"]
	}
}

