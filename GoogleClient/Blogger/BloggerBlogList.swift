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

	public func mapping(map: Map) {
		blogUserInfos <- map["blogUserInfos"]
		items <- map["items"]
		kind <- map["kind"]
	}
	public required init(arrayLiteral elements: BloggerBlog...) {
		items = elements
	}

	public typealias Generator = IndexingGenerator<[BloggerBlog]>

	public func generate() -> Generator {
		let objects = items as [BloggerBlog]
		return objects.generate()
	}

	public subscript(position: Int) -> BloggerBlog {
		return items[position]
	}
}

