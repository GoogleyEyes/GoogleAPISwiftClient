//
//  BloggerBlogList.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The BlogList model type for use with the Blogger API
public class BloggerBlogList: GoogleObjectList {
	public typealias `Type` = BloggerBlog
	/// The list of Blogs this user has Authorship or Admin rights over.
	public var items: [Type]!
	/// Admin level list of blog per-user information
	public var blogUserInfos: [BloggerBlogUserInfo]!
	/// The list of Blogs this user has Authorship or Admin rights over.
	public var items: [BloggerBlog]!
	/// The kind of this entity. Always blogger#blogList
	public var kind: String = "blogger#blogList"

	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		items <- map["items"]
		blogUserInfos <- map["blogUserInfos"]
		items <- map["items"]
		kind <- map["kind"]
	}
	public required init(arrayLiteral elements: BloggerBlog...) {
		items = elements
	}

	public typealias Iterator = IndexingIterator<[Type]>

	public func makeIterator() -> Iterator {
		let objects = items as [Type]
		return objects.makeIterator()
	}

	public subscript(position: Int) -> BloggerBlog {
		return items[position]
	}
}
