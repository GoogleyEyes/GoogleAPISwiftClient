//
//  BloggerPostUserInfosList.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The PostUserInfosList model type for use with the Blogger API
public class BloggerPostUserInfosList: GoogleObjectList {
	public typealias `Type` = BloggerPostUserInfo
	/// The list of Posts with User information for the post, for this Blog.
	public var items: [Type]!
	/// Pagination token to fetch the next page, if one exists.
	public var nextPageToken: String!
	/// The list of Posts with User information for the post, for this Blog.
	public var items: [BloggerPostUserInfo]!
	/// The kind of this entity. Always blogger#postList
	public var kind: String = "blogger#postUserInfosList"

	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		items <- map["items"]
		nextPageToken <- map["nextPageToken"]
		items <- map["items"]
		kind <- map["kind"]
	}
	public required init(arrayLiteral elements: BloggerPostUserInfo...) {
		items = elements
	}

	public typealias Iterator = IndexingIterator<[Type]>

	public func makeIterator() -> Iterator {
		let objects = items as [Type]
		return objects.makeIterator()
	}

	public subscript(position: Int) -> BloggerPostUserInfo {
		return items[position]
	}
}
