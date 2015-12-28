//
//  BloggerPageviews.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/28/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class BloggerPageviewsCount: Mappable {
	/// Time range the given count applies to
	public var timeRange: String!
	/// Count of page views for the given time range
	public var count: Int64!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		timeRange <- map["timeRange"]
		count <- map["count"]
	}
}

public class BloggerPageviews: GoogleObject {
	/// Blog Id
	public var blogId: String!
	/// The container of posts in this blog.
	public var counts: [BloggerPageviewsCount]!
	/// The kind of this entry. Always blogger#page_views
	public var kind: String = "blogger#page_views"
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		blogId <- map["blogId"]
		counts <- map["counts"]
		kind <- map["kind"]
	}
}

