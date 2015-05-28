//
//  Blogger.swift
//  GoogleClient
//
//  Created by Matthew Wyskiel on 5/24/15.
//  Copyright (c) 2015 Matthew Wyskiel. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

public class Blogger: GoogleService {
    var apiNameInURL: String = "blogger"
    var apiVersionString: String = "v3"
    
    public static let sharedInstance : Blogger = Blogger()
    private init() {
        
    }
    
    public var maxPosts: UInt?
    public var view: BloggerAccessView?
    public var fields: String?
    
    public func getBlog(#id: String, completionHandler: (blog: BloggerBlog?, error: NSError?) -> ()) {
        var queryParams = [String: String]()
        if let maxPostsParam = maxPosts {
            queryParams.updateValue(NSNumber(unsignedLong: maxPostsParam).stringValue, forKey: "maxPosts")
        }
        GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(id)", queryParams: queryParams) { (JSON, error) -> () in
            if error != nil {
                completionHandler(blog: nil, error: error)
            } else if JSON != nil {
                let blog = Mapper<BloggerBlog>().map(JSON)
                completionHandler(blog: blog, error: nil)
            }
        }
    }
    
    public func getBlog(byURL URL: NSURL, completionHandler: (blog: BloggerBlog?, error: NSError?) -> ()) {
        let encoded = URL.absoluteString?.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
        if let encoded = encoded {
            GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/byurl", queryParams: ["url": encoded]) { (JSON, error) -> () in
                if error != nil {
                    completionHandler(blog: nil, error: error)
                } else if JSON != nil {
                    let blog = Mapper<BloggerBlog>().map(JSON)
                    completionHandler(blog: blog, error: nil)
                }
            }
        }
    }
    
    public func listBlogs(byUser userID: String, completionHandler: (blog: BloggerBlog?, error: NSError?) -> ()) {
        
    }
}

public enum BloggerAccessView: String {
    case Admin = "ADMIN"
    case Author = "AUTHOR"
    case Reader = "READER"
}

public enum BloggerScopes: String {
    case Blogger = "https://www.googleapis.com/auth/blogger"
    case ReadOnly = "https://www.googleapis.com/auth/blogger.readonly"
}