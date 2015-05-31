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
    public var author: BloggerAuthor!
    
    
    public required init?(_ map: Map) {
        mapping(map)
    }
    
    public func mapping(map: Map) {
        identifier <- map["id"]
        inReplyToID <- map["inReplyTo.id"]
        postID <- map["post.id"]
        blogID <- map["blog.id"]
        published <- (map["published"], RFC3339Transform())
        updated <- (map["updated"], RFC3339Transform())
        selfLink <- (map["selfLink"], URLTransform())
        content <- map["content"]
        author <- map["author"]
        status <- map["status"]
    }
}

public enum BloggerCommentStatus: String {
    case Emptied = "emptied"
    case Live = "live"
    case Pending = "pending"
    case Spam = "spam"
}

public class BloggerAuthor: Mappable {
    public var identifier: String! // "author.id"
    public var displayName: String! // "author.displayName"
    public var url: NSURL! // "author.url"
    public var image: BloggerImage! // "author.image.url"
    
    public required init?(_ map: Map) {
        mapping(map)
    }
    
    public func mapping(map: Map) {
        identifier <- map["id"]
        displayName <- map["displayName"]
        url <- (map["url"], URLTransform())
        image <- map["image"]
    }
}

public class BloggerCommentList: GoogleObjectList {
    public typealias Type = BloggerComment
    public var kind: String = "blogger#commentList"
    public var nextPageToken: String!
    public var prevPageToken: String!
    public var items: [Type]!
    
    public required init?(_ map: Map) {
        mapping(map)
    }
    
    public func mapping(map: Map) {
        items <- map["items"]
        nextPageToken <- map["nextPageToken"]
        prevPageToken <- map["prevPageToken"]
    }
    
    public required init(arrayLiteral elements: Type...) {
        items = elements
    }
    
    public typealias Generator = IndexingGenerator<[Type]>
    
    public func generate() -> Generator {
        let objects = items as [Type]
        return objects.generate()
    }
    
    public subscript(position: Int) -> Type {
        return items[position]
    }
}
