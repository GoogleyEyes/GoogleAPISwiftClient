//
//  Blogger.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/28/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public enum BloggerPostUserInfosStatus: String {
	case Draft = "draft"
	case Live = "live"
	case Scheduled = "scheduled"
}

public enum BloggerAlt: String {
	case Json = "json"
}

public enum BloggerPostsStatus: String {
	case Draft = "draft"
	case Live = "live"
	case Scheduled = "scheduled"
}

public enum BloggerPostsView: String {
	case ADMIN = "ADMIN"
	case AUTHOR = "AUTHOR"
	case READER = "READER"
}

public enum BloggerBlogsView: String {
	case ADMIN = "ADMIN"
	case AUTHOR = "AUTHOR"
	case READER = "READER"
}

public enum BloggerPostUserInfosOrderBy: String {
	case Published = "published"
	case Updated = "updated"
}

public enum BloggerPagesStatus: String {
	case Draft = "draft"
	case Live = "live"
}

public enum BloggerBlogsStatus: String {
	case DELETED = "DELETED"
	case LIVE = "LIVE"
}

public enum BloggerPagesView: String {
	case ADMIN = "ADMIN"
	case AUTHOR = "AUTHOR"
	case READER = "READER"
}

public enum BloggerOAuthScopes: String {
	case Readonly = "https://www.googleapis.com/auth/blogger.readonly"
	case Blogger = "https://www.googleapis.com/auth/blogger"
}

public enum BloggerPostsOrderBy: String {
	case Published = "published"
	case Updated = "updated"
}

public enum BloggerCommentsView: String {
	case ADMIN = "ADMIN"
	case AUTHOR = "AUTHOR"
	case READER = "READER"
}

public enum BloggerPostUserInfosView: String {
	case ADMIN = "ADMIN"
	case AUTHOR = "AUTHOR"
	case READER = "READER"
}

public enum BloggerBlogsRole: String {
	case ADMIN = "ADMIN"
	case AUTHOR = "AUTHOR"
	case READER = "READER"
}

public enum BloggerPageViewsRange: String {
	case X30DAYS = "30DAYS"
	case X7DAYS = "7DAYS"
	case All = "all"
}

public enum BloggerCommentsStatus: String {
	case Emptied = "emptied"
	case Live = "live"
	case Pending = "pending"
	case Spam = "spam"
}

public class Blogger: GoogleService {
	var apiNameInURL: String = "blogger"
	var apiVersionString: String = "v3"

	/// OAuth 2.0 token for the current user.
	public var accessToken: String? {
		didSet {
			GoogleServiceFetcher.sharedInstance.accessToken = accessToken
		}
	}
	/// API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
	public var apiKey: String? {
		didSet {
			GoogleServiceFetcher.sharedInstance.apiKey = apiKey
		}
	}
	public static let sharedInstance = Blogger()
	private init() {

	}

	/// IP address of the site where the request originates. Use this if you want to enforce per-user limits.
	public var userIp: String!
	/// Returns response with indentations and line breaks.
	public var prettyPrint: Bool = true
	/// Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. Overrides userIp if both are provided.
	public var quotaUser: String!
	/// Selector specifying which fields to include in a partial response.
	public var fields: String!
	/// Data format for the response.
	public var alt: BloggerAlt = .Json
	
	/// Whether the body content of posts is included. Default is false.
	public var fetchBodies: Bool = false
	public var status: BloggerPostUserInfosStatus!
	/// Access level with which to view the returned result. Note that some fields require elevated access.
	public var view: BloggerPostUserInfosView!
	/// Latest post date to fetch, a date-time with RFC 3339 formatting.
	public var endDate: NSDate!
	/// Comma-separated list of labels to search for.
	public var labels: String!
	/// Continuation token if the request is paged.
	public var pageToken: String!
	/// Sort order applied to search results. Default is published.
	public var orderBy: BloggerPostUserInfosOrderBy = .PUBLISHED
	/// Maximum number of posts to fetch.
	public var maxResults: UInt!
	/// Earliest post date to fetch, a date-time with RFC 3339 formatting.
	public var startDate: NSDate!
	
	public func listPostUserInfos(userId userId: String, blogId: String, completionHandler: (postUserInfosList: BloggerPostUserInfosList?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(fetchBodies.toJSONString(), forKey: "fetchBodies")
		if let status = status {
			queryParams.updateValue(status.rawValue, forKey: "status")
		}
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let endDate = endDate {
			queryParams.updateValue(endDate.toJSONString(), forKey: "endDate")
		}
		if let labels = labels {
			queryParams.updateValue(labels, forKey: "labels")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		queryParams.updateValue(orderBy.rawValue, forKey: "orderBy")
		if let maxResults = maxResults {
			queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		}
		if let startDate = startDate {
			queryParams.updateValue(startDate.toJSONString(), forKey: "startDate")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "users/\(userId)/blogs/\(blogId)/posts", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(postUserInfosList: nil, error: error)
			} else if JSON != nil {
				let postUserInfosList = Mapper<BloggerPostUserInfosList>().map(JSON)
				completionHandler(postUserInfosList: postUserInfosList, error: nil)
			}
		}
	}

	/// Maximum number of comments to pull back on a post.
	public var maxComments: UInt!
	
	public func getPostUserInfos(userId userId: String, blogId: String, postId: String, completionHandler: (postUserInfo: BloggerPostUserInfo?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let maxComments = maxComments {
			queryParams.updateValue(maxComments.toJSONString(), forKey: "maxComments")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "users/\(userId)/blogs/\(blogId)/posts/\(postId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(postUserInfo: nil, error: error)
			} else if JSON != nil {
				let postUserInfo = Mapper<BloggerPostUserInfo>().map(JSON)
				completionHandler(postUserInfo: postUserInfo, error: nil)
			}
		}
	}

	public var range: BloggerPageViewsRange!
	
	public func getPageViews(blogId blogId: String, completionHandler: (pageviews: BloggerPageviews?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let range = range {
			queryParams.updateValue(range.rawValue, forKey: "range")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pageviews", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(pageviews: nil, error: error)
			} else if JSON != nil {
				let pageviews = Mapper<BloggerPageviews>().map(JSON)
				completionHandler(pageviews: pageviews, error: nil)
			}
		}
	}

	/// Whether to create the post as a draft (default: false).
	public var isDraft: Bool!
	/// Whether the body content of the post is included with the result (default: true).
	public var fetchBody: Bool = true
	/// Whether image URL metadata for each post is included in the returned result (default: false).
	public var fetchImages: Bool!
	
	public func insertPosts(post post: BloggerPost, blogId: String, completionHandler: (post: BloggerPost?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let isDraft = isDraft {
			queryParams.updateValue(isDraft.toJSONString(), forKey: "isDraft")
		}
		queryParams.updateValue(fetchBody.toJSONString(), forKey: "fetchBody")
		if let fetchImages = fetchImages {
			queryParams.updateValue(fetchImages.toJSONString(), forKey: "fetchImages")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts", queryParams: queryParams, postBody: Mapper<BloggerPost>().toJSON(post)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(post: nil, error: error)
			} else if JSON != nil {
				let post = Mapper<BloggerPost>().map(JSON)
				completionHandler(post: post, error: nil)
			}
		}
	}

	/// Optional date and time to schedule the publishing of the Blog. If no publishDate parameter is given, the post is either published at the a previously saved schedule date (if present), or the current time. If a future date is given, the post will be scheduled to be published.
	public var publishDate: NSDate!
	
	public func publishPosts(blogId blogId: String, postId: String, completionHandler: (post: BloggerPost?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let publishDate = publishDate {
			queryParams.updateValue(publishDate.toJSONString(), forKey: "publishDate")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/publish", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(post: nil, error: error)
			} else if JSON != nil {
				let post = Mapper<BloggerPost>().map(JSON)
				completionHandler(post: post, error: nil)
			}
		}
	}

	public func deletePosts(blogId blogId: String, postId: String, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		let queryParams = setUpQueryParams()
		GoogleServiceFetcher.sharedInstance.performRequest(.DELETE, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	/// Whether a publish action should be performed when the post is updated (default: false).
	public var publish: Bool!
	/// Whether a revert action should be performed when the post is updated (default: false).
	public var revert: Bool!
	
	public func patchPosts(post post: BloggerPost, postId: String, blogId: String, completionHandler: (post: BloggerPost?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let publish = publish {
			queryParams.updateValue(publish.toJSONString(), forKey: "publish")
		}
		if let fetchImages = fetchImages {
			queryParams.updateValue(fetchImages.toJSONString(), forKey: "fetchImages")
		}
		queryParams.updateValue(fetchBody.toJSONString(), forKey: "fetchBody")
		if let maxComments = maxComments {
			queryParams.updateValue(maxComments.toJSONString(), forKey: "maxComments")
		}
		if let revert = revert {
			queryParams.updateValue(revert.toJSONString(), forKey: "revert")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(.PATCH, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)", queryParams: queryParams, postBody: Mapper<BloggerPost>().toJSON(post)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(post: nil, error: error)
			} else if JSON != nil {
				let post = Mapper<BloggerPost>().map(JSON)
				completionHandler(post: post, error: nil)
			}
		}
	}

	public func getByPathPosts(path path: String, blogId: String, completionHandler: (post: BloggerPost?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(path, forKey: "path")
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let maxComments = maxComments {
			queryParams.updateValue(maxComments.toJSONString(), forKey: "maxComments")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/bypath", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(post: nil, error: error)
			} else if JSON != nil {
				let post = Mapper<BloggerPost>().map(JSON)
				completionHandler(post: post, error: nil)
			}
		}
	}

	public func updatePosts(post post: BloggerPost, postId: String, blogId: String, completionHandler: (post: BloggerPost?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let publish = publish {
			queryParams.updateValue(publish.toJSONString(), forKey: "publish")
		}
		if let fetchImages = fetchImages {
			queryParams.updateValue(fetchImages.toJSONString(), forKey: "fetchImages")
		}
		queryParams.updateValue(fetchBody.toJSONString(), forKey: "fetchBody")
		if let maxComments = maxComments {
			queryParams.updateValue(maxComments.toJSONString(), forKey: "maxComments")
		}
		if let revert = revert {
			queryParams.updateValue(revert.toJSONString(), forKey: "revert")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(.PUT, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)", queryParams: queryParams, postBody: Mapper<BloggerPost>().toJSON(post)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(post: nil, error: error)
			} else if JSON != nil {
				let post = Mapper<BloggerPost>().map(JSON)
				completionHandler(post: post, error: nil)
			}
		}
	}

	public func getPosts(blogId blogId: String, postId: String, completionHandler: (post: BloggerPost?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(fetchBody.toJSONString(), forKey: "fetchBody")
		if let fetchImages = fetchImages {
			queryParams.updateValue(fetchImages.toJSONString(), forKey: "fetchImages")
		}
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let maxComments = maxComments {
			queryParams.updateValue(maxComments.toJSONString(), forKey: "maxComments")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(post: nil, error: error)
			} else if JSON != nil {
				let post = Mapper<BloggerPost>().map(JSON)
				completionHandler(post: post, error: nil)
			}
		}
	}

	public func revertPosts(blogId blogId: String, postId: String, completionHandler: (post: BloggerPost?, error: ErrorType?) -> ()) {
		let queryParams = setUpQueryParams()
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/revert", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(post: nil, error: error)
			} else if JSON != nil {
				let post = Mapper<BloggerPost>().map(JSON)
				completionHandler(post: post, error: nil)
			}
		}
	}

	public func searchPosts(q q: String, blogId: String, completionHandler: (postList: BloggerPostList?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(fetchBodies.toJSONString(), forKey: "fetchBodies")
		queryParams.updateValue(orderBy.rawValue, forKey: "orderBy")
		queryParams.updateValue(q, forKey: "q")
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/search", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(postList: nil, error: error)
			} else if JSON != nil {
				let postList = Mapper<BloggerPostList>().map(JSON)
				completionHandler(postList: postList, error: nil)
			}
		}
	}

	public func listPosts(blogId blogId: String, completionHandler: (postList: BloggerPostList?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(fetchBodies.toJSONString(), forKey: "fetchBodies")
		if let status = status {
			queryParams.updateValue(status.rawValue, forKey: "status")
		}
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let fetchImages = fetchImages {
			queryParams.updateValue(fetchImages.toJSONString(), forKey: "fetchImages")
		}
		if let endDate = endDate {
			queryParams.updateValue(endDate.toJSONString(), forKey: "endDate")
		}
		if let labels = labels {
			queryParams.updateValue(labels, forKey: "labels")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		queryParams.updateValue(orderBy.rawValue, forKey: "orderBy")
		if let maxResults = maxResults {
			queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		}
		if let startDate = startDate {
			queryParams.updateValue(startDate.toJSONString(), forKey: "startDate")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(postList: nil, error: error)
			} else if JSON != nil {
				let postList = Mapper<BloggerPostList>().map(JSON)
				completionHandler(postList: postList, error: nil)
			}
		}
	}

	public func getUsers(userId userId: String, completionHandler: (user: BloggerUser?, error: ErrorType?) -> ()) {
		let queryParams = setUpQueryParams()
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "users/\(userId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(user: nil, error: error)
			} else if JSON != nil {
				let user = Mapper<BloggerUser>().map(JSON)
				completionHandler(user: user, error: nil)
			}
		}
	}

	public func markAsSpamComments(blogId blogId: String, commentId: String, postId: String, completionHandler: (comment: BloggerComment?, error: ErrorType?) -> ()) {
		let queryParams = setUpQueryParams()
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments/\(commentId)/spam", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(comment: nil, error: error)
			} else if JSON != nil {
				let comment = Mapper<BloggerComment>().map(JSON)
				completionHandler(comment: comment, error: nil)
			}
		}
	}

	public func removeContentComments(blogId blogId: String, commentId: String, postId: String, completionHandler: (comment: BloggerComment?, error: ErrorType?) -> ()) {
		let queryParams = setUpQueryParams()
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments/\(commentId)/removecontent", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(comment: nil, error: error)
			} else if JSON != nil {
				let comment = Mapper<BloggerComment>().map(JSON)
				completionHandler(comment: comment, error: nil)
			}
		}
	}

	public func deleteComments(blogId blogId: String, commentId: String, postId: String, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		let queryParams = setUpQueryParams()
		GoogleServiceFetcher.sharedInstance.performRequest(.DELETE, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments/\(commentId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	public func getComments(commentId commentId: String, postId: String, blogId: String, completionHandler: (comment: BloggerComment?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments/\(commentId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(comment: nil, error: error)
			} else if JSON != nil {
				let comment = Mapper<BloggerComment>().map(JSON)
				completionHandler(comment: comment, error: nil)
			}
		}
	}

	public func listComments(postId postId: String, blogId: String, completionHandler: (commentList: BloggerCommentList?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let fetchBodies = fetchBodies {
			queryParams.updateValue(fetchBodies.toJSONString(), forKey: "fetchBodies")
		}
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let endDate = endDate {
			queryParams.updateValue(endDate.toJSONString(), forKey: "endDate")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let maxResults = maxResults {
			queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		}
		if let startDate = startDate {
			queryParams.updateValue(startDate.toJSONString(), forKey: "startDate")
		}
		if let status = status {
			queryParams.updateValue(status.rawValue, forKey: "status")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(commentList: nil, error: error)
			} else if JSON != nil {
				let commentList = Mapper<BloggerCommentList>().map(JSON)
				completionHandler(commentList: commentList, error: nil)
			}
		}
	}

	public func approveComments(blogId blogId: String, commentId: String, postId: String, completionHandler: (comment: BloggerComment?, error: ErrorType?) -> ()) {
		let queryParams = setUpQueryParams()
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments/\(commentId)/approve", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(comment: nil, error: error)
			} else if JSON != nil {
				let comment = Mapper<BloggerComment>().map(JSON)
				completionHandler(comment: comment, error: nil)
			}
		}
	}

	public func listByBlogComments(blogId blogId: String, completionHandler: (commentList: BloggerCommentList?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let fetchBodies = fetchBodies {
			queryParams.updateValue(fetchBodies.toJSONString(), forKey: "fetchBodies")
		}
		if let endDate = endDate {
			queryParams.updateValue(endDate.toJSONString(), forKey: "endDate")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let startDate = startDate {
			queryParams.updateValue(startDate.toJSONString(), forKey: "startDate")
		}
		if let status = status {
			queryParams.updateValue(status.rawValue, forKey: "status")
		}
		if let maxResults = maxResults {
			queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/comments", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(commentList: nil, error: error)
			} else if JSON != nil {
				let commentList = Mapper<BloggerCommentList>().map(JSON)
				completionHandler(commentList: commentList, error: nil)
			}
		}
	}

	/// Maximum number of posts to pull back with the blog.
	public var maxPosts: UInt!
	
	public func getBlogs(blogId blogId: String, completionHandler: (blog: BloggerBlog?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let maxPosts = maxPosts {
			queryParams.updateValue(maxPosts.toJSONString(), forKey: "maxPosts")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(blog: nil, error: error)
			} else if JSON != nil {
				let blog = Mapper<BloggerBlog>().map(JSON)
				completionHandler(blog: blog, error: nil)
			}
		}
	}

	/// User access types for blogs to include in the results, e.g. AUTHOR will return blogs where the user has author level access. If no roles are specified, defaults to ADMIN and AUTHOR roles.
	public var role: BloggerBlogsRole!
	/// Whether the response is a list of blogs with per-user information instead of just blogs.
	public var fetchUserInfo: Bool!
	
	public func listByUserBlogs(userId userId: String, completionHandler: (blogList: BloggerBlogList?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		queryParams.updateValue(status.rawValue, forKey: "status")
		if let role = role {
			queryParams.updateValue(role.rawValue, forKey: "role")
		}
		if let fetchUserInfo = fetchUserInfo {
			queryParams.updateValue(fetchUserInfo.toJSONString(), forKey: "fetchUserInfo")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "users/\(userId)/blogs", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(blogList: nil, error: error)
			} else if JSON != nil {
				let blogList = Mapper<BloggerBlogList>().map(JSON)
				completionHandler(blogList: blogList, error: nil)
			}
		}
	}

	public func getByUrlBlogs(url url: String, completionHandler: (blog: BloggerBlog?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		queryParams.updateValue(url, forKey: "url")
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/byurl", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(blog: nil, error: error)
			} else if JSON != nil {
				let blog = Mapper<BloggerBlog>().map(JSON)
				completionHandler(blog: blog, error: nil)
			}
		}
	}

	public func insertPages(page page: BloggerPage, blogId: String, completionHandler: (page: BloggerPage?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let isDraft = isDraft {
			queryParams.updateValue(isDraft.toJSONString(), forKey: "isDraft")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages", queryParams: queryParams, postBody: Mapper<BloggerPage>().toJSON(page)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(page: nil, error: error)
			} else if JSON != nil {
				let page = Mapper<BloggerPage>().map(JSON)
				completionHandler(page: page, error: nil)
			}
		}
	}

	public func publishPages(blogId blogId: String, pageId: String, completionHandler: (page: BloggerPage?, error: ErrorType?) -> ()) {
		let queryParams = setUpQueryParams()
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages/\(pageId)/publish", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(page: nil, error: error)
			} else if JSON != nil {
				let page = Mapper<BloggerPage>().map(JSON)
				completionHandler(page: page, error: nil)
			}
		}
	}

	public func deletePages(blogId blogId: String, pageId: String, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		let queryParams = setUpQueryParams()
		GoogleServiceFetcher.sharedInstance.performRequest(.DELETE, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages/\(pageId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	public func patchPages(page page: BloggerPage, pageId: String, blogId: String, completionHandler: (page: BloggerPage?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let publish = publish {
			queryParams.updateValue(publish.toJSONString(), forKey: "publish")
		}
		if let revert = revert {
			queryParams.updateValue(revert.toJSONString(), forKey: "revert")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(.PATCH, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages/\(pageId)", queryParams: queryParams, postBody: Mapper<BloggerPage>().toJSON(page)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(page: nil, error: error)
			} else if JSON != nil {
				let page = Mapper<BloggerPage>().map(JSON)
				completionHandler(page: page, error: nil)
			}
		}
	}

	public func updatePages(page page: BloggerPage, pageId: String, blogId: String, completionHandler: (page: BloggerPage?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let publish = publish {
			queryParams.updateValue(publish.toJSONString(), forKey: "publish")
		}
		if let revert = revert {
			queryParams.updateValue(revert.toJSONString(), forKey: "revert")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(.PUT, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages/\(pageId)", queryParams: queryParams, postBody: Mapper<BloggerPage>().toJSON(page)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(page: nil, error: error)
			} else if JSON != nil {
				let page = Mapper<BloggerPage>().map(JSON)
				completionHandler(page: page, error: nil)
			}
		}
	}

	public func getPages(blogId blogId: String, pageId: String, completionHandler: (page: BloggerPage?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages/\(pageId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(page: nil, error: error)
			} else if JSON != nil {
				let page = Mapper<BloggerPage>().map(JSON)
				completionHandler(page: page, error: nil)
			}
		}
	}

	public func revertPages(blogId blogId: String, pageId: String, completionHandler: (page: BloggerPage?, error: ErrorType?) -> ()) {
		let queryParams = setUpQueryParams()
		GoogleServiceFetcher.sharedInstance.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages/\(pageId)/revert", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(page: nil, error: error)
			} else if JSON != nil {
				let page = Mapper<BloggerPage>().map(JSON)
				completionHandler(page: page, error: nil)
			}
		}
	}

	public func listPages(blogId blogId: String, completionHandler: (pageList: BloggerPageList?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let fetchBodies = fetchBodies {
			queryParams.updateValue(fetchBodies.toJSONString(), forKey: "fetchBodies")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let maxResults = maxResults {
			queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		}
		if let status = status {
			queryParams.updateValue(status.rawValue, forKey: "status")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(pageList: nil, error: error)
			} else if JSON != nil {
				let pageList = Mapper<BloggerPageList>().map(JSON)
				completionHandler(pageList: pageList, error: nil)
			}
		}
	}

	public func getBlogUserInfos(blogId blogId: String, userId: String, completionHandler: (blogUserInfo: BloggerBlogUserInfo?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let maxPosts = maxPosts {
			queryParams.updateValue(maxPosts.toJSONString(), forKey: "maxPosts")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "users/\(userId)/blogs/\(blogId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(blogUserInfo: nil, error: error)
			} else if JSON != nil {
				let blogUserInfo = Mapper<BloggerBlogUserInfo>().map(JSON)
				completionHandler(blogUserInfo: blogUserInfo, error: nil)
			}
		}
	}

	func setUpQueryParams() -> [String: String] {
		var queryParams = [String: String]()
		if let userIp = userIp {
			queryParams.updateValue(userIp, forKey: "userIp")
		}
		queryParams.updateValue(prettyPrint.toJSONString(), forKey: "prettyPrint")
		if let quotaUser = quotaUser {
			queryParams.updateValue(quotaUser, forKey: "quotaUser")
		}
		if let fields = fields {
			queryParams.updateValue(fields, forKey: "fields")
		}
		queryParams.updateValue(alt.rawValue, forKey: "alt")
		return queryParams
	}
}

