//
//  BloggerBlogUserInfo.swift
//  GoogleClient
//
//  Created by Matthew Wyskiel on 5/28/15.
//  Copyright (c) 2015 Matthew Wyskiel. All rights reserved.
//

import UIKit
import ObjectMapper

public class BloggerBlogUserInfo: GoogleObject {
    public var kind: String = "blogger#blogUserInfo"
    public var blog: BloggerBlog!
    public var blogUserInfo: BloggerBlogPerUserInfo!
    
    public required init(_ map: Map) {
        mapping(map)
    }
    
    public func mapping(map: Map) {
        blog <- map["blog"]
        blogUserInfo <- map["blog_user_info"]
    }
}

public class BloggerBlogPerUserInfo: GoogleObject {
    public var kind: String = "blogger#blogPerUserInfo"
    public var userID: String!
    public var blogID: String!
    public var photosAlbumKey: String!
    public var hasAdminAccess: Bool!
    
    public required init(_ map: Map) {
        mapping(map)
    }
    
    public func mapping(map: Map) {
        userID <- map["userId"]
        blogID <- map["blogId"]
        photosAlbumKey <- map["photosAlbumKey"]
        hasAdminAccess <- map["hasAdminAccess"]
    }
}
