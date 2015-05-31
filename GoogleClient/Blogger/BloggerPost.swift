//
//  BloggerPost.swift
//  GoogleClient
//
//  Created by Matthew Wyskiel on 5/28/15.
//  Copyright (c) 2015 Matthew Wyskiel. All rights reserved.
//

import UIKit
import ObjectMapper

public class BloggerPost: GoogleObject {
    public var kind: String = "blogger#post"
    public var identifier: String!
    public var status: BloggerPageStatus?
    public var blogID: String! // "blog.id"
    public var published: NSDate!
    public var updated: NSDate!
    public var selfLink: NSURL!
    public var url: NSURL!
    public var title: String!
    public var titleLink: NSURL?
    public var content: String!
    public var author: BloggerAuthor!
    public var images: [BloggerImage]?
    public var customMetaData: String?
    public var totalNumberOfReplies: UInt! // "replies.totalItems"
    public var repliesResourceLink: NSURL! // "replies.selfLink"
    public var replies: [BloggerComment]? // "replies.items"
    public var labels: [String]!
    public var location: BloggerPostLocation?
    
    public required init(_ map: Map) {
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
        titleLink <- (map["titleLink"], URLTransform())
        content <- map["content"]
        images <- map["images"]
        author <- map["author"]
        status <- (map["status"], EnumTransform<BloggerPageStatus>())
        customMetaData <- map["customMetaData"]
        totalNumberOfReplies <- map["replies.totalItems"]
        repliesResourceLink <- (map["replies.selfLink"], URLTransform())
        replies <- map["replies.items"]
        labels <- map["labels"]
        location <- map["location"]
    }
}

public class BloggerImage: Mappable {
    public var URL: NSURL!
    
    public required init(_ map: Map) {
        mapping(map)
    }
    
    public func mapping(map: Map) {
        URL <- map["url"]
    }
}

public class BloggerPostLocation: Mappable {
    public var name: String!
    public var latitude: Double! // "lat"
    public var longitude: Double! // "lng"
    public var span: String!
    
    public required init(_ map: Map) {
        mapping(map)
    }
    
    public func mapping(map: Map) {
        name <- map["name"]
        latitude <- map["lat"]
        longitude <- map["lng"]
        span <- map["span"]
    }
}
