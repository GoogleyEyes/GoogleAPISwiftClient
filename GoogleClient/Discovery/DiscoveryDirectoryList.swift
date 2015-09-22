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
    
    public required init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        kind <- map["kind"]
        discoveryVersion <- map["discoveryVersion"]
        items <- map["items"]
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
    
    public required init?(_ map: Map) {
        
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
