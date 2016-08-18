//
//  BloggerCommentList.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The CommentList model type for use with the Blogger API
public class BloggerCommentList: GoogleObjectList {
	/// Pagination token to fetch the next page, if one exists.
	public var nextPageToken: String!
	/// The kind of this entry. Always blogger#commentList
	public var kind: String = "blogger#commentList"
	/// Etag of the response.
	public var etag: String!
	/// The List of Comments for a Post.
	public var items: [BloggerComment]!
	/// Pagination token to fetch the previous page, if one exists.
	public var prevPageToken: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		nextPageToken <- map["nextPageToken"]
		kind <- map["kind"]
		etag <- map["etag"]
		items <- map["items"]
		prevPageToken <- map["prevPageToken"]
	}
	public required init(arrayLiteral elements: BloggerComment...) {
		items = elements
	}

	public typealias Generator = IndexingGenerator<[BloggerComment]>

	public func generate() -> Generator {
		let objects = items as [BloggerComment]
		return objects.generate()
	}

	public subscript(position: Int) -> BloggerComment {
		return items[position]
	}
}

