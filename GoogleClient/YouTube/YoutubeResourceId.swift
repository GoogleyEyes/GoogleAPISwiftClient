//
//  YoutubeResourceId.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeResourceId: ObjectType {
	/// The ID that YouTube uses to uniquely identify the referred resource, if that resource is a channel. This property is only present if the resourceId.kind value is youtube#channel.
	public var channelId: String!
	/// The ID that YouTube uses to uniquely identify the referred resource, if that resource is a video. This property is only present if the resourceId.kind value is youtube#video.
	public var videoId: String!
	/// The ID that YouTube uses to uniquely identify the referred resource, if that resource is a playlist. This property is only present if the resourceId.kind value is youtube#playlist.
	public var playlistId: String!
	/// The type of the API resource.
	public var kind: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		channelId <- map["channelId"]
		videoId <- map["videoId"]
		playlistId <- map["playlistId"]
		kind <- map["kind"]
	}
}

