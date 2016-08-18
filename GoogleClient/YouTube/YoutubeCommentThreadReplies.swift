//
//  YoutubeCommentThreadReplies.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Comments written in (direct or indirect) reply to the top level comment.
public class YoutubeCommentThreadReplies: ObjectType {
	/// A limited number of replies. Unless the number of replies returned equals total_reply_count in the snippet the returned replies are only a subset of the total number of replies.
	public var comments: [YoutubeComment]!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		comments <- map["comments"]
	}
}

