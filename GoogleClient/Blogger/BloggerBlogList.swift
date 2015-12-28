//
//  BloggerBlogList.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/28/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class BloggerBlogList: GoogleObjectList {
	public typealias Type = BloggerBlog
	/// The list of Blogs this user has Authorship or Admin rights over.
	public var items: [Type]!
	/// Admin level list of blog per-user information
	public var blogUserInfos: [BloggerBlogUserInfo]!
	/// The kind of this entity. Always blogger#blogList
	public var kind: String = "blogger#blogList"
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		items <- map["items"]
		blogUserInfos <- map["blogUserInfos"]
		kind <- map["kind"]
	}
	public required init(arrayLiteral elements: Type...) {
		items = elements
	}

	public typealias Generator = IndexingGenerator<[Type]>

	public func generate() -> Generator {
		let objects = items as [Type]
		return objects.generate()
	}

	public subscript(position: Int) -> Type {
		return items[position]
	}
}

