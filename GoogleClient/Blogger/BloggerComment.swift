//
//  BloggerComment.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class BloggerComment: GoogleObject {
	/// The author of this Comment.
	public var author: BloggerCommentAuthor!
	/// The actual content of the comment. May include HTML markup.
	public var content: String!
	/// Data about the blog containing this comment.
	public var blog: BloggerCommentBlog!
	/// RFC 3339 date-time when this comment was published.
	public var published: NSDate!
	/// The identifier for this resource.
	public var id: String!
	/// Data about the post containing this comment.
	public var post: BloggerCommentPost!
	/// Data about the comment this is in reply to.
	public var inReplyTo: BloggerCommentInReplyTo!
	/// The kind of this entry. Always blogger#comment
	public var kind: String = "blogger#comment"
	/// The API REST URL to fetch this resource from.
	public var selfLink: String!
	/// RFC 3339 date-time when this comment was last updated.
	public var updated: NSDate!
	/// The status of the comment (only populated for admin users)
	public var status: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		author <- map["author"]
		content <- map["content"]
		blog <- map["blog"]
		published <- (map["published"], RFC3339Transform())
		id <- map["id"]
		post <- map["post"]
		inReplyTo <- map["inReplyTo"]
		kind <- map["kind"]
		selfLink <- map["selfLink"]
		updated <- (map["updated"], RFC3339Transform())
		status <- map["status"]
	}
}

public class BloggerCommentAuthorImage: ObjectType {
	/// The comment creator's avatar URL.
	public var url: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		url <- map["url"]
	}
}

public class BloggerCommentAuthor: ObjectType {
	/// The comment creator's avatar.
	public var image: BloggerCommentAuthorImage!
	/// The identifier of the Comment creator.
	public var id: String!
	/// The display name.
	public var displayName: String!
	/// The URL of the Comment creator's Profile page.
	public var url: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		image <- map["image"]
		id <- map["id"]
		displayName <- map["displayName"]
		url <- map["url"]
	}
}

public class BloggerCommentPost: ObjectType {
	/// The identifier of the post containing this comment.
	public var id: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		id <- map["id"]
	}
}

public class BloggerCommentBlog: ObjectType {
	/// The identifier of the blog containing this comment.
	public var id: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		id <- map["id"]
	}
}

public class BloggerCommentInReplyTo: ObjectType {
	/// The identified of the parent of this comment.
	public var id: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		id <- map["id"]
	}
}

