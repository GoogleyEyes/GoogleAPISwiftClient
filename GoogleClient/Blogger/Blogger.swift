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
    public var fetchUserInfo: Bool?
    public var role: BloggerAccessView?
    public var blogStatus: BloggerBlogStatus?
    public var startDate: NSDate?
    public var endDate: NSDate?
    public var fetchBodies: Bool?
    public var maxResults: UInt?
    public var pageToken: String?
    public var commentStatus: BloggerCommentStatus?
    
    
    // MARK: Blog methods
    public func getBlog(#id: String, completionHandler: (blog: BloggerBlog?, error: NSError?) -> ()) {
        var queryParams = setUpStandardQueryParams()
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
        var queryParams = setUpStandardQueryParams()
        let encoded = URL.absoluteString?.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
        if let encodedURL = encoded {
            queryParams.updateValue(encodedURL, forKey: "url")
            GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/byurl", queryParams: queryParams) { (JSON, error) -> () in
                if error != nil {
                    completionHandler(blog: nil, error: error)
                } else if JSON != nil {
                    let blog = Mapper<BloggerBlog>().map(JSON)
                    completionHandler(blog: blog, error: nil)
                }
            }
        }
    }
    
    public func listBlogs(byUser userID: String, completionHandler: (blog: BloggerBlogList?, error: NSError?) -> ()) {
        var queryParams = setUpStandardQueryParams()
        if let fetchUserInfoParam = fetchUserInfo {
            queryParams.updateValue(fetchUserInfoParam.toJSONAndQueryString(), forKey: "fetchUserInfo")
        }
        if let roleParam = role {
            queryParams.updateValue(roleParam.rawValue, forKey: "role")
        }
        if let statusParam = blogStatus {
            queryParams.updateValue(statusParam.rawValue, forKey: "status")
        }
        
        GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "users/\(userID)/blogs", queryParams: queryParams) { (JSON, error) -> () in
            if error != nil {
                completionHandler(blog: nil, error: error)
            } else if JSON != nil {
                let blogList = Mapper<BloggerBlogList>().map(JSON)
                completionHandler(blog: blogList, error: nil)
            }
        }
    }
    
    // MARK: Comment methods
    
    public func listComments(#blogID: String, postID: String, completionHandler: (blog: BloggerCommentList?, error: NSError?) -> ()) {
        var queryParams = setUpStandardQueryParams()
        if let startDateParam = startDate {
            let jsonDateTime = RFC3339Transform().transformToJSON(startDateParam)
            queryParams.updateValue(jsonDateTime!, forKey: "startDate")
        }
        if let endDateParam = endDate {
            let jsonDateTime = RFC3339Transform().transformToJSON(endDateParam)
            queryParams.updateValue(jsonDateTime!, forKey: "endDate")
        }
        if let fetchBodiesParam = fetchBodies {
            queryParams.updateValue(fetchBodiesParam.toJSONAndQueryString(), forKey: "fetchBodies")
        }
        if let maxResultsParam = maxResults {
            queryParams.updateValue(NSNumber(unsignedLong: maxResultsParam).stringValue, forKey: "maxResults")
        }
        if let pageTokenParam = pageToken {
            queryParams.updateValue(pageTokenParam, forKey: "pageToken")
        }
        if let statusParam = commentStatus {
            queryParams.updateValue(statusParam.rawValue, forKey: "status")
        }
        
        GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogID)/posts/\(postID)/comments", queryParams: queryParams) { (JSON, error) -> () in
            if error != nil {
                completionHandler(blog: nil, error: error)
            } else if JSON != nil {
                let commentList = Mapper<BloggerCommentList>().map(JSON)
                completionHandler(blog: commentList, error: nil)
            }
        }
    }
    
    func setUpStandardQueryParams() -> [String: String] {
        var queryParams = [String: String]()
        if let view = view {
            queryParams.updateValue(view.rawValue, forKey: "view")
        }
        if let fields = fields {
            queryParams.updateValue(fields, forKey: "fields")
        }
        return queryParams
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