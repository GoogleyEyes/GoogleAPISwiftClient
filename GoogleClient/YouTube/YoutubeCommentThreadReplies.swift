//
//  YoutubeCommentThreadReplies.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeCommentThreadReplies: Mappable {
	/// A limited number of replies. Unless the number of replies returned equals total_reply_count in the snippet the returned replies are only a subset of the total number of replies.
	public var comments: [YoutubeComment]!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		comments <- map["comments"]
	}
}

