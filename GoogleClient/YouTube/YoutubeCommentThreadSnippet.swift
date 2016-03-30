//
//  YoutubeCommentThreadSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeCommentThreadSnippet: ObjectType {
	/// The YouTube channel the comments in the thread refer to or the channel with the video the comments refer to. If video_id isn't set the comments refer to the channel itself.
	public var channelId: String!
	/// The top level comment of this thread.
	public var topLevelComment: YoutubeComment!
	/// The ID of the video the comments refer to, if any. No video_id implies a channel discussion comment.
	public var videoId: String!
	/// The total number of replies (not including the top level comment).
	public var totalReplyCount: UInt!
	/// Whether the current viewer of the thread can reply to it. This is viewer specific - other viewers may see a different value for this field.
	public var canReply: Bool!
	/// Whether the thread (and therefore all its comments) is visible to all YouTube users.
	public var isPublic: Bool!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		channelId <- map["channelId"]
		topLevelComment <- map["topLevelComment"]
		videoId <- map["videoId"]
		totalReplyCount <- map["totalReplyCount"]
		canReply <- map["canReply"]
		isPublic <- map["isPublic"]
	}
}

