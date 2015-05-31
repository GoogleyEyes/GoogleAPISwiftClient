//
//  BloggerPageViews.swift
//  GoogleClient
//
//  Created by Matthew Wyskiel on 5/28/15.
//  Copyright (c) 2015 Matthew Wyskiel. All rights reserved.
//

import UIKit
import ObjectMapper

public class BloggerPageViews: GoogleObject {
    public var kind: String = "blogger#page_views"
    public var blogID: String! // "blogId"
    public var counts: [BloggerPageViewsCount]!
    
    public required init(_ map: Map) {
        mapping(map)
    }
    
    public func mapping(map: Map) {
        blogID <- map["blogId"]
        counts <- map["counts"]
    }
}

public class BloggerPageViewsCount: Mappable {
    public var timeRange: String!
    public var count: UInt!
    
    public required init(_ map: Map) {
        mapping(map)
    }
    
    public func mapping(map: Map) {
        timeRange <- map["timeRange"]
        count <- map["count"]
    }
}
