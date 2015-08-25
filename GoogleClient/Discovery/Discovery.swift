//
//  Discovery.swift
//  
//
//  Created by Matthew Wyskiel on 6/13/15.
//
//

import Foundation
import ObjectMapper

public class Discovery: GoogleService {
    var apiNameInURL: String = "discovery"
    var apiVersionString: String = "v1"
    
    public var accessToken: String? {
        didSet {
            GoogleServiceFetcher.sharedInstance.accessToken = accessToken
        }
    }
    public var apiKey: String? {
        didSet {
            GoogleServiceFetcher.sharedInstance.apiKey = apiKey
        }
    }
    
    public static let sharedInstance : Discovery = Discovery()
    private init() {
        
    }
    
    public var alt: DiscoveryAlt?
    public var fields: String?
    public var prettyPrint: Bool?
    public var quotaUser: String?
    public var userIp: String?
    
    public func getDiscoveryDocument(forAPI api: String, version /* begins with 'v' followed by number */: String, completionHandler: (restDescription: DiscoveryRestDescription?, error: ErrorType?) -> ()) {
        let queryParams = setUpQueryParams()
        GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "apis/\(api)/\(version)/rest", queryParams: queryParams) { (JSON, error) -> () in
            if error != nil {
                completionHandler(restDescription: nil, error: error)
            } else if JSON != nil {
                let jsonString = JSON!
                let restDescription = Mapper<DiscoveryRestDescription>().map(jsonString)
                completionHandler(restDescription: restDescription, error: nil)
            }
        }
    }
    
    public var name: String?
    public var preferred: Bool?
    
    public func listAPIs(completionHandler: (list: DiscoveryDirectoryList?, error: ErrorType?) -> ()) {
        var queryParams = setUpQueryParams()
        if let name = name {
            queryParams.updateValue(name, forKey: "name")
        }
        if let preferred = preferred {
            queryParams.updateValue(preferred.toJSONAndQueryString(), forKey: "preferred")
        }
        
        GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "apis", queryParams: queryParams) { (JSON, error) -> () in
            if error != nil {
                completionHandler(list: nil, error: error)
            } else if JSON != nil {
                let list = Mapper<DiscoveryDirectoryList>().map(JSON)
                completionHandler(list: list, error: nil)
            }
        }
    }
    
    func setUpQueryParams() -> [String: String] {
        var queryParams = [String: String]()
        if let alt = alt {
            queryParams.updateValue(alt.rawValue, forKey: "alt")
        }
        if let fields = fields {
            queryParams.updateValue(fields, forKey: "fields")
        }
        if let prettyPrint = prettyPrint {
            queryParams.updateValue(prettyPrint.toJSONAndQueryString(), forKey: "prettyPrint")
        }
        if let quotaUser = quotaUser {
            queryParams.updateValue(quotaUser, forKey: "quotaUser")
        }
        if let userIp = userIp {
            queryParams.updateValue(userIp, forKey: "userIp")
        }
        return queryParams
    }
    
}

public enum DiscoveryAlt: String {
    case JSON = "json"
}