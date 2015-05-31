//
//  BloggerPage.swift
//  GoogleClient
//
//  Created by Matthew Wyskiel on 5/28/15.
//  Copyright (c) 2015 Matthew Wyskiel. All rights reserved.
//

import UIKit
import ObjectMapper

public class BloggerPage: GoogleObject {
    public var kind: String = "blogger#page"
    public var identifier: String!
    public var status: BloggerPageStatus?
    public var blogID: String! // "blog.id"
    public var published: NSDate!
    public var updated: NSDate!
    public var selfLink: NSURL!
    public var url: NSURL!
    public var title: String!
    public var content: String!
    public var author: BloggerAuthor!
    
    public required init?(_ map: Map) {
        mapping(map)
    }
    
    public func mapping(map: Map) {
        identifier <- map["id"]
        blogID <- map["blog.id"]
        published <- (map["published"], RFC3339Transform())
        updated <- (map["updated"], RFC3339Transform())
        selfLink <- (map["selfLink"], URLTransform())
        url <- (map["url"], URLTransform())
        title <- map["title"]
        content <- map["content"]
        author <- map["author"]
        status <- (map["status"], EnumTransform<BloggerPageStatus>())
    }
}

public enum BloggerPageStatus: String {
    case Live = "LIVE"
    case Draft = "DRAFT"
}
