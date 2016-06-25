//
//  BloggerPage.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 6/23/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The Blog subtype of the Page model type for use with the Blogger API
public class BloggerPageBlog: ObjectType {
	/// The identifier of the blog containing this page.
	public var id: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		id <- map["id"]
	}
}

/// The Page model type for use with the Blogger API
public class BloggerPage: GoogleObject {
	/// The author of this Page.
	public var author: BloggerPageAuthor!
	/// The title of this entity. This is the name displayed in the Admin user interface.
	public var title: String!
	/// Data about the blog containing this Page.
	public var blog: BloggerPageBlog!
	/// RFC 3339 date-time when this Page was published.
	public var published: NSDate!
	/// The identifier for this resource.
	public var id: String!
	/// The body content of this Page, in HTML.
	public var content: String!
	/// The URL that this Page is displayed at.
	public var url: String!
	/// The kind of this entity. Always blogger#page
	public var kind: String = "blogger#page"
	/// Etag of the resource.
	public var etag: String!
	/// The status of the page for admin resources (either LIVE or DRAFT).
	public var status: String!
	/// The API REST URL to fetch this resource from.
	public var selfLink: String!
	/// RFC 3339 date-time when this Page was last updated.
	public var updated: NSDate!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		author <- map["author"]
		title <- map["title"]
		blog <- map["blog"]
		published <- (map["published"], RFC3339Transform())
		id <- map["id"]
		content <- map["content"]
		url <- map["url"]
		kind <- map["kind"]
		etag <- map["etag"]
		status <- map["status"]
		selfLink <- map["selfLink"]
		updated <- (map["updated"], RFC3339Transform())
	}
}

/// The Image subtype of the PageAuthor model type for use with the Blogger API
public class BloggerPageAuthorImage: ObjectType {
	/// The page author's avatar URL.
	public var url: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		url <- map["url"]
	}
}

/// The Author subtype of the Page model type for use with the Blogger API
public class BloggerPageAuthor: ObjectType {
	/// The page author's avatar.
	public var image: BloggerPageAuthorImage!
	/// The identifier of the Page creator.
	public var id: String!
	/// The display name.
	public var displayName: String!
	/// The URL of the Page creator's Profile page.
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

