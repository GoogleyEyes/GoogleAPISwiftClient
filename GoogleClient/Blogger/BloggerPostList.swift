//
//  BloggerPostList.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The PostList model type for use with the Blogger API
public class BloggerPostList: GoogleObjectList {
	public typealias `Type` = BloggerPost
	/// The list of Posts for this Blog.
	public var items: [Type]!
	/// Pagination token to fetch the next page, if one exists.
	public var nextPageToken: String!
	/// Etag of the response.
	public var etag: String!
	/// The list of Posts for this Blog.
	public var items: [BloggerPost]!
	/// The kind of this entity. Always blogger#postList
	public var kind: String = "blogger#postList"

	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		items <- map["items"]
		nextPageToken <- map["nextPageToken"]
		etag <- map["etag"]
		items <- map["items"]
		kind <- map["kind"]
	}
	public required init(arrayLiteral elements: BloggerPost...) {
		items = elements
	}

	public typealias Iterator = IndexingIterator<[Type]>

	public func makeIterator() -> Iterator {
		let objects = items as [Type]
		return objects.makeIterator()
	}

	public subscript(position: Int) -> BloggerPost {
		return items[position]
	}
}
