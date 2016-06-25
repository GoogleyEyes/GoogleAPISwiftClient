//
//  BloggerPost.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 6/23/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The Blog subtype of the Post model type for use with the Blogger API
public class BloggerPostBlog: ObjectType {
	/// The identifier of the Blog that contains this Post.
	public var id: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		id <- map["id"]
	}
}

/// The Post model type for use with the Blogger API
public class BloggerPost: GoogleObject {
	/// The title of the Post.
	public var title: String!
	/// The content of the Post. May contain HTML markup.
	public var content: String!
	/// Display image for the Post.
	public var images: [BloggerPostImage]!
	/// RFC 3339 date-time when this Post was published.
	public var published: Date!
	/// The JSON meta-data for the Post.
	public var customMetaData: String!
	/// The kind of this entity. Always blogger#post
	public var kind: String = "blogger#post"
	/// The location for geotagged posts.
	public var location: BloggerPostLocation!
	/// Etag of the resource.
	public var etag: String!
	/// RFC 3339 date-time when this Post was last updated.
	public var updated: Date!
	/// The author of this Post.
	public var author: BloggerPostAuthor!
	/// The title link URL, similar to atom's related link.
	public var titleLink: String!
	/// Data about the blog containing this Post.
	public var blog: BloggerPostBlog!
	/// The identifier of this Post.
	public var id: String!
	/// Comment control and display setting for readers of this post.
	public var readerComments: String!
	/// The list of labels this Post was tagged with.
	public var labels: [String]!
	/// The container of comments on this Post.
	public var replies: BloggerPostReplies!
	/// Status of the post. Only set for admin-level requests
	public var status: String!
	/// The API REST URL to fetch this resource from.
	public var selfLink: String!
	/// The URL where this Post is displayed.
	public var url: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		title <- map["title"]
		content <- map["content"]
		images <- map["images"]
		published <- (map["published"], RFC3339Transform())
		customMetaData <- map["customMetaData"]
		kind <- map["kind"]
		location <- map["location"]
		etag <- map["etag"]
		updated <- (map["updated"], RFC3339Transform())
		author <- map["author"]
		titleLink <- map["titleLink"]
		blog <- map["blog"]
		id <- map["id"]
		readerComments <- map["readerComments"]
		labels <- map["labels"]
		replies <- map["replies"]
		status <- map["status"]
		selfLink <- map["selfLink"]
		url <- map["url"]
	}
}

/// The Author subtype of the Post model type for use with the Blogger API
public class BloggerPostAuthor: ObjectType {
	/// The Post author's avatar.
	public var image: BloggerPostImage!
	/// The identifier of the Post creator.
	public var id: String!
	/// The display name.
	public var displayName: String!
	/// The URL of the Post creator's Profile page.
	public var url: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		image <- map["image"]
		id <- map["id"]
		displayName <- map["displayName"]
		url <- map["url"]
	}
}

/// The Images subtype of the Post model type for use with the Blogger API
public class BloggerPostImage: ObjectType {
	public var url: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		url <- map["url"]
	}
}

/// The Location subtype of the Post model type for use with the Blogger API
public class BloggerPostLocation: ObjectType {
	/// Location's longitude.
	public var lng: Double!
	/// Location's latitude.
	public var lat: Double!
	/// Location's viewport span. Can be used when rendering a map preview.
	public var span: String!
	/// Location name.
	public var name: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		lng <- map["lng"]
		lat <- map["lat"]
		span <- map["span"]
		name <- map["name"]
	}
}

/// The Replies subtype of the Post model type for use with the Blogger API
public class BloggerPostReplies: ObjectType {
	/// The List of Comments for this Post.
	public var items: [BloggerComment]!
	/// The URL of the comments on this post.
	public var selfLink: String!
	/// The count of comments on this post.
	public var totalItems: Int64!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		items <- map["items"]
		selfLink <- map["selfLink"]
		totalItems <- map["totalItems"]
	}
}

/// The Image subtype of the PostAuthor model type for use with the Blogger API
public class BloggerPostAuthorImage: ObjectType {
	/// The Post author's avatar URL.
	public var url: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		url <- map["url"]
	}
}

