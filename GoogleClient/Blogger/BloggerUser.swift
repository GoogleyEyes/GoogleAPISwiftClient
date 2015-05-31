//
//  BloggerUser.swift
//  GoogleClient
//
//  Created by Matthew Wyskiel on 5/28/15.
//  Copyright (c) 2015 Matthew Wyskiel. All rights reserved.
//

import UIKit
import ObjectMapper

public class BloggerUser: GoogleObject {
    public var kind: String = "blogger#user"
    public var identifier: String! // "id"
    public var created: NSDate!
    public var url: NSURL!
    public var selfLink: NSURL!
    public var blogsLink: NSURL! // "blogs.selfLink"
    public var displayName: String!
    public var about: String!
    public var locale: BloggerLocale!
    
    public required init(_ map: Map) {
        mapping(map)
    }
    
    public func mapping(map: Map) {
        identifier <- map["id"]
        created <- (map["created"], RFC3339Transform())
        url <- (map["url"], URLTransform())
        selfLink <- (map["selfLink"], URLTransform())
        blogsLink <- (map["blogs.selfLink"], URLTransform())
        displayName <- map["displayName"]
        about <- map["about"]
        locale <- map["locale"]
    }
}
