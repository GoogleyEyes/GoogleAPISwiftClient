//
//  BloggerPageList.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 6/10/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class BloggerPageList: GoogleObjectList {
	public typealias `Type` = BloggerPage
	/// The list of Pages for a Blog.
	public var items: [Type]!
	/// Pagination token to fetch the next page, if one exists.
	public var nextPageToken: String!
	/// Etag of the response.
	public var etag: String!
	/// The kind of this entity. Always blogger#pageList
	public var kind: String = "blogger#pageList"
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		items <- map["items"]
		nextPageToken <- map["nextPageToken"]
		etag <- map["etag"]
		kind <- map["kind"]
	}
	public required init(arrayLiteral elements: Type...) {
		items = elements
	}

	public typealias Iterator = IndexingIterator<[Type]>

	public func makeIterator() -> Iterator {
		let objects = items as [Type]
		return objects.makeIterator()
	}

	public subscript(position: Int) -> Type {
		return items[position]
	}
}

