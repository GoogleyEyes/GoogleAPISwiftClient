//
//  BloggerComment.swift
//  GoogleClient
//
//  Created by Matthew Wyskiel on 5/25/15.
//  Copyright (c) 2015 Matthew Wyskiel. All rights reserved.
//

import UIKit
import ObjectMapper

public class BloggerComment: GoogleObject {
    public var kind: String = "blogger#comment"
    public var status: String?
    public var identifier: String!
    public var inReplyToID: String? // "inReplyTo.id"
    public var postID: String! // "post.id"
    public var blogID: String! // "blog.id"
    public var published: NSDate!
    public var updated: NSDate!
    public var selfLink: NSURL!
    public var content: String!
    public var author: BloggerCommentAuthor!
    
    
    public required init?(_ map: Map) {
        mapping(map)
    }
    
    public func mapping(map: Map) {
        kind <- map["kind"]
        identifier <- map["id"]
        inReplyToID <- map["inReplyTo.id"]
        postID <- map["post.id"]
        blogID <- map["blog.id"]
        published <- (map["published"], RFC3339Transform())
        updated <- (map["updated"], RFC3339Transform())
        selfLink <- (map["selfLink"], URLTransform())
        content <- map["content"]
        author <- map["author"]
    }
}

public class BloggerCommentAuthor: Mappable {
    public var identifier: String! // "author.id"
    public var displayName: String! // "author.displayName"
    public var url: NSURL! // "author.url"
    public var imageURL: NSURL! // "author.image.url"
    
    public required init?(_ map: Map) {
        mapping(map)
    }
    
    public func mapping(map: Map) {
        identifier <- map["id"]
        displayName <- map["displayName"]
        url <- (map["url"], URLTransform())
        imageURL <- (map["image.url"], URLTransform())
    }
}
