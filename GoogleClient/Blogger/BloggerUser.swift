//
//  BloggerUser.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 6/23/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The User model type for use with the Blogger API
public class BloggerUser: GoogleObject {
	/// This user's locale
	public var locale: BloggerUserLocale!
	/// Profile summary information.
	public var about: String!
	/// The identifier for this User.
	public var id: String!
	/// The display name.
	public var displayName: String!
	/// The kind of this entity. Always blogger#user
	public var kind: String = "blogger#user"
	/// The timestamp of when this profile was created, in seconds since epoch.
	public var created: NSDate!
	/// The container of blogs for this user.
	public var blogs: BloggerUserBlogs!
	/// The API REST URL to fetch this resource from.
	public var selfLink: String!
	/// The user's profile page.
	public var url: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		locale <- map["locale"]
		about <- map["about"]
		id <- map["id"]
		displayName <- map["displayName"]
		kind <- map["kind"]
		created <- (map["created"], RFC3339Transform())
		blogs <- map["blogs"]
		selfLink <- map["selfLink"]
		url <- map["url"]
	}
}

/// The Blogs subtype of the User model type for use with the Blogger API
public class BloggerUserBlogs: ObjectType {
	/// The URL of the Blogs for this user.
	public var selfLink: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		selfLink <- map["selfLink"]
	}
}

/// The Locale subtype of the User model type for use with the Blogger API
public class BloggerUserLocale: ObjectType {
	/// The user's country setting.
	public var country: String!
	/// The user's language setting.
	public var language: String!
	/// The user's language variant setting.
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

