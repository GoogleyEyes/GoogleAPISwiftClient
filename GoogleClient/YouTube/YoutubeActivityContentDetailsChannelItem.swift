//
//  YoutubeActivityContentDetailsChannelItem.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Details about a resource which was added to a channel.
public class YoutubeActivityContentDetailsChannelItem: ObjectType {
	/// The resourceId object contains information that identifies the resource that was added to the channel.
	public var resourceId: YoutubeResourceId!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		resourceId <- map["resourceId"]
	}
}

