//
//  DiscoveryRestDescription.swift
//  
//
//  Created by Matthew Wyskiel on 6/13/15.
//
//

import Foundation
import ObjectMapper

public class DiscoveryRestDescription: GoogleObject {
    public var kind: String = "discovery#restDescription"
    public var discoveryVersion: String!
    public var identifier: String! // id
    public var name: String!
    public var version: String!
    public var revision: String!
    public var title: String!
    public var APIDescription: String! // description
    public var icons: DiscoveryAPIIcon!
    public var documentationLink: NSURL!
    public var labels: [String]!
    public var APIProtocol: String! // protocol
    public var rootURL: String! // rootUrl
    public var baseURL: String! // baseUrl; DEPRECATED
    public var basePath: String! // DEPRECATED
    public var servicePath: String!
    public var batchPath: String!
    public var parameters: [String: DiscoveryJSONSchema]!
    public var auth: DiscoveryAuth!
    public var features: [String]!
    public var schemas: [String: DiscoveryJSONSchema]!
    public var methods: [String: DiscoveryRestMethod]!
    public var resources: [String: DiscoveryResource]!
    
    public required init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        kind <- map["kind"]
        discoveryVersion <- map["discoveryVersion"]
        identifier <- map["id"]
        name <- map["name"]
        version <- map["version"]
        revision <- map["revision"]
        title <- map["title"]
        APIDescription <- map["description"]
        icons <- map["icons"]
        documentationLink <- (map["documentationLink"], URLTransform())
        labels <- map["labels"]
        APIProtocol <- map["protocol"]
        rootURL <- map["rootUrl"]
        baseURL <- map["baseUrl"]
        basePath <- map["basePath"]
        servicePath <- map["servicePath"]
        batchPath <- map["batchPath"]
        parameters <- map["parameters"]
        auth <- map["auth"]
        features <- map["features"]
        schemas <- map["schemas"]
        methods <- map["methods"]
        resources <- map["resources"]
    }
}

public class DiscoveryAPIIcon: Mappable {
    public var x16: NSURL!
    public var x32: NSURL!
    
    public required init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        x16 <- (map["x16"], URLTransform())
        x32 <- (map["x32"], URLTransform())
    }
}

public class DiscoveryAuth: Mappable { // assuming OAuth 2
    public var OAuthScopes: [String: DiscoveryAuthScope]! // oauth2.scopes
    
    public required init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        OAuthScopes <- map["oauth2.scopes"]
    }
}

public class DiscoveryAuthScope: Mappable {
    public var scopeDescription: String! // description
    
    public required init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        scopeDescription <- map["description"]
    }
}

public class DiscoveryJSONSchema: Mappable {
    public var identifier: String! // id
    public var type: String!
    public var xRef: String! // $ref
    public var schemaDescription: String! // description
    public var defaultValue: String? // default
    public var required: Bool!
    public var format: String!
    public var pattern: String!
    public var minimum: String!
    public var maximum: String!
    public var enumValues: [String]! // enum
    public var enumDescriptions: [String]!
    public var repeated: Bool!
    public var location: String!
    public var properties: [String: DiscoveryJSONSchema]!
    public var additionalProperties: DiscoveryJSONSchema!
    public var items: DiscoveryJSONSchema!
    public var annotations: DiscoveryJSONSchemaAnnotations!
    
    public required init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        identifier <- map["id"]
        type <- map["type"]
        xRef <- map["$ref"]
        schemaDescription <- map["description"]
        defaultValue <- map["default"]
        required <- map["required"]
        format <- map["format"]
        pattern <- map["pattern"]
        minimum <- map["minimum"]
        maximum <- map["maximum"]
        enumValues <- map["enum"]
        enumDescriptions <- map["enumDescriptions"]
        repeated <- map["repeated"]
        location <- map["location"]
        properties <- map["properties"]
        additionalProperties <- map["additionalProperties"]
        items <- map["items"]
        annotations <- map["annotations"]
    }
}

public class DiscoveryJSONSchemaAnnotations: Mappable {
    public var required: [String]!
    
    public required init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        required <- map["required"]
    }
}

public class DiscoveryRestMethod: Mappable {
    public var identifier: String! // id
    public var path: String!
    public var httpMethod: String!
    public var methodDescription: String! // description
    public var parameters: [String: DiscoveryJSONSchema]!
    public var parameterOrder: [String]!
    public var requestRef: String! // request.$ref
    public var responseRef: String! // response.$ref
    public var scopes: [String]!
    public var supportsMediaDownload: Bool!
    public var supportsMediaUpload: Bool!
    public var mediaUpload: DiscoveryRestMethodMediaUpload!
    public var supportsSubscription: Bool!
    
    public required init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        identifier <- map["id"]
        path <- map["path"]
        httpMethod <- map["httpMethod"]
        methodDescription <- map["description"]
        parameters <- map["parameters"]
        parameterOrder <- map["parameterOrder"]
        requestRef <- map["request.$ref"]
        responseRef <- map["response.$ref"]
        scopes <- map["scopes"]
        supportsMediaDownload <- map["supportsMediaDownload"]
        supportsMediaUpload <- map["supportsMediaUpload"]
        mediaUpload <- map["mediaUpload"]
        supportsSubscription <- map["supportsSubscription"]
    }
}

public class DiscoveryRestMethodMediaUpload: Mappable {
    public var accept: [String]!
    public var maxSize: String!
    public var protocols: [String: DiscoveryRestMethodMediaUploadProtocol]!
    
    public required init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        accept <- map["accept"]
        maxSize <- map["maxSize"]
        protocols <- map["protocols"]
    }
}

public enum DiscoveryRestMethodMediaUploadProtocolType: String {
    case Simple = "simple"
    case Resumable = "resumable"
}

public class DiscoveryRestMethodMediaUploadProtocol: Mappable {
    public var multipart: Bool = true
    public var path: String!
    
    public required init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        path <- map["path"]
    }
}

public class DiscoveryResource: Mappable {
    public var methods: [String: DiscoveryRestMethod]!
    public var subResources: [String: DiscoveryResource]! // resources
    
    public required init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        methods <- map["methods"]
        subResources <- map["resources"]
    }
}

