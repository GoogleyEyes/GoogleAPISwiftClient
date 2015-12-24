//
//  YoutubeComment.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeComment: GoogleObject {
	/// The snippet object contains basic details about the comment.
	public var snippet: YoutubeCommentSnippet!
	/// Etag of this resource.
	public var etag: String!
	/// The ID that YouTube uses to uniquely identify the comment.
	public var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#comment".
	public var kind: String = "youtube#comment"
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		kind <- map["kind"]
	}
}

