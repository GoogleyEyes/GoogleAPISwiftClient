//
//  YoutubeCommentThread.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// A comment thread represents information that applies to a top level comment and all its replies. It can also include the top level comment itself and some of the replies.
public class YoutubeCommentThread: GoogleObject {
	/// The snippet object contains basic details about the comment thread and also the top level comment.
	public var snippet: YoutubeCommentThreadSnippet!
	/// Etag of this resource.
	public var etag: String!
	/// The ID that YouTube uses to uniquely identify the comment thread.
	public var id: String!
	/// The replies object contains a limited number of replies (if any) to the top level comment found in the snippet.
	public var replies: YoutubeCommentThreadReplies!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#commentThread".
	public var kind: String = "youtube#commentThread"
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		replies <- map["replies"]
		kind <- map["kind"]
	}
}

