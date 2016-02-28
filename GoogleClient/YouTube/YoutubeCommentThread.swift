//
//  YoutubeCommentThread.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

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

	public func mapping(map: Map) {
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		replies <- map["replies"]
		kind <- map["kind"]
	}
}

