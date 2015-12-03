//
//  BloggerCommentList.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 10/19/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class BloggerCommentList: GoogleObjectList {
	public typealias Type = BloggerComment
	/// The List of Comments for a Post.
	public var items: [Type]!
	/// Pagination token to fetch the next page, if one exists.
	public var nextPageToken: String!
	/// The kind of this entry. Always blogger#commentList
	public var kind: String!
	/// Etag of the response.
	public var etag: String!
	/// The List of Comments for a Post.
	public var items: [BloggerComment]!
	/// Pagination token to fetch the previous page, if one exists.
	public var prevPageToken: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		items <- map["items"]
		nextPageToken <- map["nextPageToken"]
		kind <- map["kind"]
		etag <- map["etag"]
		items <- map["items"]
		prevPageToken <- map["prevPageToken"]
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

