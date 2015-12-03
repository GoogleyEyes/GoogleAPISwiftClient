//
//  BloggerPageviews.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 10/19/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class BloggerPageviews: GoogleObject {
	/// Blog Id
	public var blogId: String!
	/// The container of posts in this blog.
	public var counts: !
	/// The kind of this entry. Always blogger#page_views
	public var kind: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		blogId <- map["blogId"]
		counts <- map["counts"]
		kind <- map["kind"]
	}

