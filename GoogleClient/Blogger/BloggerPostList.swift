//
//  BloggerPostList.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 10/19/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class BloggerPostList: GoogleObjectList {
	public typealias Type = BloggerPost
	/// The list of Posts for this Blog.
	public var items: [Type]!
	/// Pagination token to fetch the next page, if one exists.
	public var nextPageToken: String!
	/// Etag of the response.
	public var etag: String!
	/// The list of Posts for this Blog.
	public var items: [BloggerPost]!
	/// The kind of this entity. Always blogger#postList
	public var kind: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		items <- map["items"]
		nextPageToken <- map["nextPageToken"]
		etag <- map["etag"]
		items <- map["items"]
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

