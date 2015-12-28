//
//  BloggerPage.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/28/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class BloggerPageBlog: Mappable {
	/// The identifier of the blog containing this page.
	public var id: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		id <- map["id"]
	}
}

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

public class BloggerPageAuthorImage: Mappable {
	/// The page author's avatar URL.
	public var url: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		url <- map["url"]
	}
}

public class BloggerPageAuthor: Mappable {
	/// The page author's avatar.
	public var image: BloggerPageImage!
	/// The identifier of the Page creator.
	public var id: String!
	/// The display name.
	public var displayName: String!
	/// The URL of the Page creator's Profile page.
	public var url: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		image <- map["image"]
		id <- map["id"]
		displayName <- map["displayName"]
		url <- map["url"]
	}
}

