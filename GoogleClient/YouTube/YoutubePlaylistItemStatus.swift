//
//  YoutubePlaylistItemStatus.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubePlaylistItemStatus: Mappable {
	/// This resource's privacy status.
	public var privacyStatus: YoutubePlaylistItemStatusPrivacyStatus!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		privacyStatus <- map["privacyStatus"]
	}
}

