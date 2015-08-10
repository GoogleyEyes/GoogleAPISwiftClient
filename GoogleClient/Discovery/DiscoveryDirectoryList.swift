//
//  DiscoveryDirectoryList.swift
//  
//
//  Created by Matthew Wyskiel on 6/13/15.
//
//

import Foundation
import ObjectMapper

public class DiscoveryDirectoryList: GoogleObjectList {
    public var kind: String = "discovery#directoryList"
    public var discoveryVersion: String!
    public typealias Type = DiscoveryDirectoryItem
    public var items: [Type]!
    
    public class func newInstance(map: Map) -> Mappable? {
        return DiscoveryDirectoryList()
    }
    
    public func mapping(map: Map) {
        kind <- map["kind"]
        discoveryVersion <- map["discoveryVersion"]
        items <- map["items"]
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

public class DiscoveryDirectoryItem: GoogleObject {
    public var kind: String = "discovery#directoryList"
    public var identifier: String! // id
    public var name: String!
    public var version: String!
    public var title: String!
    public var APIDescription: String! // description
    public var icons: DiscoveryAPIIcon!
    public var documentationLink: NSURL!
    public var discoveryRestURL: NSURL! // discoveryRestUrl
    public var discoveryLink: String!
    public var labels: [String]!
    public var preferred: Bool!
    
    public class func newInstance(map: Map) -> Mappable? {
        return DiscoveryDirectoryItem()
    }
    
    public func mapping(map: Map) {
        kind <- map["kind"]
        identifier <- map["id"]
        name <- map["name"]
        version <- map["version"]
        title <- map["title"]
        APIDescription <- map["description"]
        icons <- map["icons"]
        documentationLink <- (map["documentationLink"], URLTransform())
        discoveryRestURL <- (map["discoveryRestUrl"], URLTransform())
        discoveryLink <- map["discoveryLink"]
        labels <- map["labels"]
        preferred <- map["preferred"]
    }
}
