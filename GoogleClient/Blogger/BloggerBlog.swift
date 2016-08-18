//
//  BloggerBlog.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The Blog model type for use with the Blogger API
public class BloggerBlog: GoogleObject {
	/// The locale this Blog is set to.
	public var locale: BloggerBlogLocale!
	/// The API REST URL to fetch this resource from.
	public var selfLink: String!
	/// RFC 3339 date-time when this blog was published.
	public var published: NSDate!
	/// The JSON custom meta-data for the Blog
	public var customMetaData: String!
	/// The kind of this entry. Always blogger#blog
	public var kind: String = "blogger#blog"
	/// The description of this blog. This is displayed underneath the title.
	public var description: String!
	/// RFC 3339 date-time when this blog was last updated.
	public var updated: NSDate!
	/// The name of this blog. This is displayed as the title.
	public var name: String!
	/// The identifier for this resource.
	public var id: String!
	/// The container of posts in this blog.
	public var posts: BloggerBlogPosts!
	/// The container of pages in this blog.
	public var pages: BloggerBlogPages!
	/// The URL where this blog is published.
	public var url: String!
	/// The status of the blog.
	public var status: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		locale <- map["locale"]
		selfLink <- map["selfLink"]
		published <- (map["published"], RFC3339Transform())
		customMetaData <- map["customMetaData"]
		kind <- map["kind"]
		description <- map["description"]
		updated <- (map["updated"], RFC3339Transform())
		name <- map["name"]
		id <- map["id"]
		posts <- map["posts"]
		pages <- map["pages"]
		url <- map["url"]
		status <- map["status"]
	}
}

/// The Locale subtype of the Blog model type for use with the Blogger API
public class BloggerBlogLocale: ObjectType {
	/// The country this blog's locale is set to.
	public var country: String!
	/// The language this blog is authored in.
	public var language: String!
	/// The language variant this blog is authored in.
	public var variant: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		country <- map["country"]
		language <- map["language"]
		variant <- map["variant"]
	}
}

/// The Posts subtype of the Blog model type for use with the Blogger API
public class BloggerBlogPosts: ObjectType {
	/// The List of Posts for this Blog.
	public var items: [BloggerPost]!
	/// The URL of the container for posts in this blog.
	public var selfLink: String!
	/// The count of posts in this blog.
	public var totalItems: Int!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		items <- map["items"]
		selfLink <- map["selfLink"]
		totalItems <- map["totalItems"]
	}
}

/// The Pages subtype of the Blog model type for use with the Blogger API
public class BloggerBlogPages: ObjectType {
	/// The URL of the container for pages in this blog.
	public var selfLink: String!
	/// The count of pages in this blog.
	public var totalItems: Int!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		selfLink <- map["selfLink"]
		totalItems <- map["totalItems"]
	}
}

