//
//  BloggerCommentList.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/12/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
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
	public var kind: String = "blogger#commentList"
	/// Etag of the response.
	public var etag: String!
	/// Pagination token to fetch the previous page, if one exists.
	public var prevPageToken: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		items <- map["items"]
		nextPageToken <- map["nextPageToken"]
		kind <- map["kind"]
		etag <- map["etag"]
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

