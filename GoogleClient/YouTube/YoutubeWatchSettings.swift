//
//  YoutubeWatchSettings.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The WatchSettings model type for use with the Youtube API
public class YoutubeWatchSettings: ObjectType {
	/// An ID that uniquely identifies a playlist that displays next to the video player.
	public var featuredPlaylistId: String!
	/// The background color for the video watch page's branded area.
	public var textColor: String!
	/// The text color for the video watch page's branded area.
	public var backgroundColor: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		featuredPlaylistId <- map["featuredPlaylistId"]
		textColor <- map["textColor"]
		backgroundColor <- map["backgroundColor"]
	}
}

