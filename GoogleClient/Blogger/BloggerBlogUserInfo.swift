//
//  BloggerBlogUserInfo.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/12/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class BloggerBlogUserInfo: GoogleObject {
	/// The Blog resource.
	public var blog: BloggerBlog!
	/// Information about a User for the Blog.
	public var blogUserInfo: BloggerBlogPerUserInfo!
	/// The kind of this entity. Always blogger#blogUserInfo
	public var kind: String = "blogger#blogUserInfo"
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		blog <- map["blog"]
		blogUserInfo <- map["blog_user_info"]
		kind <- map["kind"]
	}
}

