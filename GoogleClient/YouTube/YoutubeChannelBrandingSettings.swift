//
//  YoutubeChannelBrandingSettings.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ChannelBrandingSettings model type for use with the Youtube API
public class YoutubeChannelBrandingSettings: ObjectType {
	/// Branding properties for the channel view.
	public var channel: YoutubeChannelSettings!
	/// Branding properties for branding images.
	public var image: YoutubeImageSettings!
	/// Branding properties for the watch page.
	public var watch: YoutubeWatchSettings!
	/// Additional experimental branding properties.
	public var hints: [YoutubePropertyValue]!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		channel <- map["channel"]
		image <- map["image"]
		watch <- map["watch"]
		hints <- map["hints"]
	}
}

