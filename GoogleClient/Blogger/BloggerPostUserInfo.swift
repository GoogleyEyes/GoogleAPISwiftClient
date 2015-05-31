//
//  BloggerPostUserInfo.swift
//  GoogleClient
//
//  Created by Matthew Wyskiel on 5/28/15.
//  Copyright (c) 2015 Matthew Wyskiel. All rights reserved.
//

import UIKit
import ObjectMapper

public class BloggerPostUserInfo: GoogleObject {
    public var kind: String = "blogger#blogUserInfo"
    public var blog: BloggerBlog!
    public var postUserInfo: BloggerPostPerUserInfo!
    
    public required init(_ map: Map) {
        mapping(map)
    }
    
    public func mapping(map: Map) {
        blog <- map["blog"]
        postUserInfo <- map["post_user_info"]
    }
}

public class BloggerPostPerUserInfo: GoogleObject {
    public var kind: String = "blogger#postPerUserInfo"
    public var userID: String!
    public var blogID: String!
    public var postID: String!
    public var hasEditAccess: Bool!
    
    public required init(_ map: Map) {
        mapping(map)
    }
    
    public func mapping(map: Map) {
        userID <- map["userId"]
        blogID <- map["blogId"]
        postID <- map["postId"]
        hasEditAccess <- map["hasEditAccess"]
    }
}
