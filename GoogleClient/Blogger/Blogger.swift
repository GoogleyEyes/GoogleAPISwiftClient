//
//  Blogger.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 10/19/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

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
	public var prettyPrint: Bool!
	/// Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. Overrides userIp if both are provided.
	public var quotaUser: String!
	/// Selector specifying which fields to include in a partial response.
	public var fields: String!
	/// Data format for the response.
	public var alt: BloggerAlt!
	/// API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
	public var key: String!
	/// OAuth 2.0 token for the current user.
	public var oauthToken: String!
	
	/// Whether the body content of posts is included. Default is false.
	public var fetchBodies: Bool!
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
	public var orderBy: BloggerPostUserInfosOrderBy!
	/// Maximum number of posts to fetch.
	public var maxResults: UInt!
	/// Earliest post date to fetch, a date-time with RFC 3339 formatting.
	public var startDate: NSDate!
	
	public func listPostUserInfos(userId userId: String!, blogId: String!, completionHandler: (PostUserInfosList: BloggerPostUserInfosList?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let fetchBodies = fetchBodies {
			queryParams.updateValue(fetchBodies.toJSONAndQueryString(), forKey: "fetchBodies")
		}
		if let status = status {
			queryParams.updateValue(status.rawValue, forKey: "status")
		}
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let endDate = endDate {
			queryParams.updateValue(endDate, forKey: "endDate")
		}
		if let labels = labels {
			queryParams.updateValue(labels, forKey: "labels")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let orderBy = orderBy {
			queryParams.updateValue(orderBy.rawValue, forKey: "orderBy")
		}
		if let maxResults = maxResults {
			queryParams.updateValue(maxResults, forKey: "maxResults")
		}
		if let startDate = startDate {
			queryParams.updateValue(startDate, forKey: "startDate")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "users/\(userId)/blogs/\(blogId)/posts", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(PostUserInfosList: nil, error: error)
			} else if JSON != nil {
				let PostUserInfosList = Mapper<BloggerPostUserInfosList>().map(JSON)
				completionHandler(PostUserInfosList: PostUserInfosList, error: nil)
			}
		}
	}

	/// Maximum number of comments to pull back on a post.
	public var maxComments: UInt!
	
	public func getPostUserInfos(userId userId: String!, blogId: String!, postId: String!, completionHandler: (PostUserInfo: BloggerPostUserInfo?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let maxComments = maxComments {
			queryParams.updateValue(maxComments, forKey: "maxComments")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "users/\(userId)/blogs/\(blogId)/posts/\(postId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(PostUserInfo: nil, error: error)
			} else if JSON != nil {
				let PostUserInfo = Mapper<BloggerPostUserInfo>().map(JSON)
				completionHandler(PostUserInfo: PostUserInfo, error: nil)
			}
		}
	}

	public var range: BloggerPageViewsRange!
	
	public func getPageViews(blogId blogId: String!, completionHandler: (Pageviews: BloggerPageviews?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let range = range {
			queryParams.updateValue(range.rawValue, forKey: "range")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pageviews", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(Pageviews: nil, error: error)
			} else if JSON != nil {
				let Pageviews = Mapper<BloggerPageviews>().map(JSON)
				completionHandler(Pageviews: Pageviews, error: nil)
			}
		}
	}

	/// Whether to create the post as a draft (default: false).
	public var isDraft: Bool!
	/// Whether the body content of the post is included with the result (default: true).
	public var fetchBody: Bool!
	/// Whether image URL metadata for each post is included in the returned result (default: false).
	public var fetchImages: Bool!
	
	public func insertPosts(blogId blogId: String!, completionHandler: (Post: BloggerPost?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let isDraft = isDraft {
			queryParams.updateValue(isDraft.toJSONAndQueryString(), forKey: "isDraft")
		}
		if let fetchBody = fetchBody {
			queryParams.updateValue(fetchBody.toJSONAndQueryString(), forKey: "fetchBody")
		}
		if let fetchImages = fetchImages {
			queryParams.updateValue(fetchImages.toJSONAndQueryString(), forKey: "fetchImages")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(Post: nil, error: error)
			} else if JSON != nil {
				let Post = Mapper<BloggerPost>().map(JSON)
				completionHandler(Post: Post, error: nil)
			}
		}
	}

	/// Optional date and time to schedule the publishing of the Blog. If no publishDate parameter is given, the post is either published at the a previously saved schedule date (if present), or the current time. If a future date is given, the post will be scheduled to be published.
	public var publishDate: NSDate!
	
	public func publishPosts(blogId blogId: String!, postId: String!, completionHandler: (Post: BloggerPost?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let publishDate = publishDate {
			queryParams.updateValue(publishDate, forKey: "publishDate")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/publish", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(Post: nil, error: error)
			} else if JSON != nil {
				let Post = Mapper<BloggerPost>().map(JSON)
				completionHandler(Post: Post, error: nil)
			}
		}
	}

	public func deletePosts(blogId blogId: String!, postId: String!, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	/// Whether a publish action should be performed when the post is updated (default: false).
	public var publish: Bool!
	/// Whether image URL metadata for each post is included in the returned result (default: false).
	public var fetchImages: Bool!
	/// Whether the body content of the post is included with the result (default: true).
	public var fetchBody: Bool!
	/// Maximum number of comments to retrieve with the returned post.
	public var maxComments: UInt!
	/// Whether a revert action should be performed when the post is updated (default: false).
	public var revert: Bool!
	
	public func patchPosts(postId postId: String!, blogId: String!, completionHandler: (Post: BloggerPost?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let publish = publish {
			queryParams.updateValue(publish.toJSONAndQueryString(), forKey: "publish")
		}
		if let fetchImages = fetchImages {
			queryParams.updateValue(fetchImages.toJSONAndQueryString(), forKey: "fetchImages")
		}
		if let fetchBody = fetchBody {
			queryParams.updateValue(fetchBody.toJSONAndQueryString(), forKey: "fetchBody")
		}
		if let maxComments = maxComments {
			queryParams.updateValue(maxComments, forKey: "maxComments")
		}
		if let revert = revert {
			queryParams.updateValue(revert.toJSONAndQueryString(), forKey: "revert")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(Post: nil, error: error)
			} else if JSON != nil {
				let Post = Mapper<BloggerPost>().map(JSON)
				completionHandler(Post: Post, error: nil)
			}
		}
	}

	/// Access level with which to view the returned result. Note that some fields require elevated access.
	public var view: BloggerPostsView!
	/// Maximum number of comments to pull back on a post.
	public var maxComments: UInt!
	
	public func getByPathPosts(path path: String!, blogId: String!, completionHandler: (Post: BloggerPost?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let maxComments = maxComments {
			queryParams.updateValue(maxComments, forKey: "maxComments")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/bypath", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(Post: nil, error: error)
			} else if JSON != nil {
				let Post = Mapper<BloggerPost>().map(JSON)
				completionHandler(Post: Post, error: nil)
			}
		}
	}

	/// Whether a publish action should be performed when the post is updated (default: false).
	public var publish: Bool!
	/// Whether image URL metadata for each post is included in the returned result (default: false).
	public var fetchImages: Bool!
	/// Whether the body content of the post is included with the result (default: true).
	public var fetchBody: Bool!
	/// Maximum number of comments to retrieve with the returned post.
	public var maxComments: UInt!
	/// Whether a revert action should be performed when the post is updated (default: false).
	public var revert: Bool!
	
	public func updatePosts(postId postId: String!, blogId: String!, completionHandler: (Post: BloggerPost?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let publish = publish {
			queryParams.updateValue(publish.toJSONAndQueryString(), forKey: "publish")
		}
		if let fetchImages = fetchImages {
			queryParams.updateValue(fetchImages.toJSONAndQueryString(), forKey: "fetchImages")
		}
		if let fetchBody = fetchBody {
			queryParams.updateValue(fetchBody.toJSONAndQueryString(), forKey: "fetchBody")
		}
		if let maxComments = maxComments {
			queryParams.updateValue(maxComments, forKey: "maxComments")
		}
		if let revert = revert {
			queryParams.updateValue(revert.toJSONAndQueryString(), forKey: "revert")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(Post: nil, error: error)
			} else if JSON != nil {
				let Post = Mapper<BloggerPost>().map(JSON)
				completionHandler(Post: Post, error: nil)
			}
		}
	}

	/// Whether the body content of the post is included (default: true). This should be set to false when the post bodies are not required, to help minimize traffic.
	public var fetchBody: Bool!
	/// Whether image URL metadata for each post is included (default: false).
	public var fetchImages: Bool!
	/// Access level with which to view the returned result. Note that some fields require elevated access.
	public var view: BloggerPostsView!
	/// Maximum number of comments to pull back on a post.
	public var maxComments: UInt!
	
	public func getPosts(blogId blogId: String!, postId: String!, completionHandler: (Post: BloggerPost?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let fetchBody = fetchBody {
			queryParams.updateValue(fetchBody.toJSONAndQueryString(), forKey: "fetchBody")
		}
		if let fetchImages = fetchImages {
			queryParams.updateValue(fetchImages.toJSONAndQueryString(), forKey: "fetchImages")
		}
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let maxComments = maxComments {
			queryParams.updateValue(maxComments, forKey: "maxComments")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(Post: nil, error: error)
			} else if JSON != nil {
				let Post = Mapper<BloggerPost>().map(JSON)
				completionHandler(Post: Post, error: nil)
			}
		}
	}

	public func revertPosts(blogId blogId: String!, postId: String!, completionHandler: (Post: BloggerPost?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/revert", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(Post: nil, error: error)
			} else if JSON != nil {
				let Post = Mapper<BloggerPost>().map(JSON)
				completionHandler(Post: Post, error: nil)
			}
		}
	}

	/// Whether the body content of posts is included (default: true). This should be set to false when the post bodies are not required, to help minimize traffic.
	public var fetchBodies: Bool!
	/// Sort search results
	public var orderBy: BloggerPostsOrderBy!
	
	public func searchPosts(q q: String!, blogId: String!, completionHandler: (PostList: BloggerPostList?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let fetchBodies = fetchBodies {
			queryParams.updateValue(fetchBodies.toJSONAndQueryString(), forKey: "fetchBodies")
		}
		if let orderBy = orderBy {
			queryParams.updateValue(orderBy.rawValue, forKey: "orderBy")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/search", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(PostList: nil, error: error)
			} else if JSON != nil {
				let PostList = Mapper<BloggerPostList>().map(JSON)
				completionHandler(PostList: PostList, error: nil)
			}
		}
	}

	/// Whether the body content of posts is included (default: true). This should be set to false when the post bodies are not required, to help minimize traffic.
	public var fetchBodies: Bool!
	/// Statuses to include in the results.
	public var status: BloggerPostsStatus!
	/// Access level with which to view the returned result. Note that some fields require escalated access.
	public var view: BloggerPostsView!
	/// Whether image URL metadata for each post is included.
	public var fetchImages: Bool!
	/// Latest post date to fetch, a date-time with RFC 3339 formatting.
	public var endDate: NSDate!
	/// Comma-separated list of labels to search for.
	public var labels: String!
	/// Continuation token if the request is paged.
	public var pageToken: String!
	/// Sort search results
	public var orderBy: BloggerPostsOrderBy!
	/// Maximum number of posts to fetch.
	public var maxResults: UInt!
	/// Earliest post date to fetch, a date-time with RFC 3339 formatting.
	public var startDate: NSDate!
	
	public func listPosts(blogId blogId: String!, completionHandler: (PostList: BloggerPostList?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let fetchBodies = fetchBodies {
			queryParams.updateValue(fetchBodies.toJSONAndQueryString(), forKey: "fetchBodies")
		}
		if let status = status {
			queryParams.updateValue(status.rawValue, forKey: "status")
		}
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let fetchImages = fetchImages {
			queryParams.updateValue(fetchImages.toJSONAndQueryString(), forKey: "fetchImages")
		}
		if let endDate = endDate {
			queryParams.updateValue(endDate, forKey: "endDate")
		}
		if let labels = labels {
			queryParams.updateValue(labels, forKey: "labels")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let orderBy = orderBy {
			queryParams.updateValue(orderBy.rawValue, forKey: "orderBy")
		}
		if let maxResults = maxResults {
			queryParams.updateValue(maxResults, forKey: "maxResults")
		}
		if let startDate = startDate {
			queryParams.updateValue(startDate, forKey: "startDate")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(PostList: nil, error: error)
			} else if JSON != nil {
				let PostList = Mapper<BloggerPostList>().map(JSON)
				completionHandler(PostList: PostList, error: nil)
			}
		}
	}

	public func getUsers(userId userId: String!, completionHandler: (User: BloggerUser?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "users/\(userId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(User: nil, error: error)
			} else if JSON != nil {
				let User = Mapper<BloggerUser>().map(JSON)
				completionHandler(User: User, error: nil)
			}
		}
	}

	public func markAsSpamComments(blogId blogId: String!, commentId: String!, postId: String!, completionHandler: (Comment: BloggerComment?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments/\(commentId)/spam", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(Comment: nil, error: error)
			} else if JSON != nil {
				let Comment = Mapper<BloggerComment>().map(JSON)
				completionHandler(Comment: Comment, error: nil)
			}
		}
	}

	public func deleteComments(blogId blogId: String!, commentId: String!, postId: String!, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments/\(commentId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	public func removeContentComments(blogId blogId: String!, commentId: String!, postId: String!, completionHandler: (Comment: BloggerComment?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments/\(commentId)/removecontent", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(Comment: nil, error: error)
			} else if JSON != nil {
				let Comment = Mapper<BloggerComment>().map(JSON)
				completionHandler(Comment: Comment, error: nil)
			}
		}
	}

	/// Access level for the requested comment (default: READER). Note that some comments will require elevated permissions, for example comments where the parent posts which is in a draft state, or comments that are pending moderation.
	public var view: BloggerCommentsView!
	
	public func getComments(commentId commentId: String!, postId: String!, blogId: String!, completionHandler: (Comment: BloggerComment?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments/\(commentId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(Comment: nil, error: error)
			} else if JSON != nil {
				let Comment = Mapper<BloggerComment>().map(JSON)
				completionHandler(Comment: Comment, error: nil)
			}
		}
	}

	/// Whether the body content of the comments is included.
	public var fetchBodies: Bool!
	/// Access level with which to view the returned result. Note that some fields require elevated access.
	public var view: BloggerCommentsView!
	/// Latest date of comment to fetch, a date-time with RFC 3339 formatting.
	public var endDate: NSDate!
	/// Continuation token if request is paged.
	public var pageToken: String!
	/// Maximum number of comments to include in the result.
	public var maxResults: UInt!
	/// Earliest date of comment to fetch, a date-time with RFC 3339 formatting.
	public var startDate: NSDate!
	public var status: BloggerCommentsStatus!
	
	public func listComments(postId postId: String!, blogId: String!, completionHandler: (CommentList: BloggerCommentList?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let fetchBodies = fetchBodies {
			queryParams.updateValue(fetchBodies.toJSONAndQueryString(), forKey: "fetchBodies")
		}
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let endDate = endDate {
			queryParams.updateValue(endDate, forKey: "endDate")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let maxResults = maxResults {
			queryParams.updateValue(maxResults, forKey: "maxResults")
		}
		if let startDate = startDate {
			queryParams.updateValue(startDate, forKey: "startDate")
		}
		if let status = status {
			queryParams.updateValue(status.rawValue, forKey: "status")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(CommentList: nil, error: error)
			} else if JSON != nil {
				let CommentList = Mapper<BloggerCommentList>().map(JSON)
				completionHandler(CommentList: CommentList, error: nil)
			}
		}
	}

	public func approveComments(blogId blogId: String!, commentId: String!, postId: String!, completionHandler: (Comment: BloggerComment?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments/\(commentId)/approve", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(Comment: nil, error: error)
			} else if JSON != nil {
				let Comment = Mapper<BloggerComment>().map(JSON)
				completionHandler(Comment: Comment, error: nil)
			}
		}
	}

	/// Whether the body content of the comments is included.
	public var fetchBodies: Bool!
	/// Latest date of comment to fetch, a date-time with RFC 3339 formatting.
	public var endDate: NSDate!
	/// Continuation token if request is paged.
	public var pageToken: String!
	/// Earliest date of comment to fetch, a date-time with RFC 3339 formatting.
	public var startDate: NSDate!
	public var status: BloggerCommentsStatus!
	/// Maximum number of comments to include in the result.
	public var maxResults: UInt!
	
	public func listByBlogComments(blogId blogId: String!, completionHandler: (CommentList: BloggerCommentList?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let fetchBodies = fetchBodies {
			queryParams.updateValue(fetchBodies.toJSONAndQueryString(), forKey: "fetchBodies")
		}
		if let endDate = endDate {
			queryParams.updateValue(endDate, forKey: "endDate")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let startDate = startDate {
			queryParams.updateValue(startDate, forKey: "startDate")
		}
		if let status = status {
			queryParams.updateValue(status.rawValue, forKey: "status")
		}
		if let maxResults = maxResults {
			queryParams.updateValue(maxResults, forKey: "maxResults")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/comments", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(CommentList: nil, error: error)
			} else if JSON != nil {
				let CommentList = Mapper<BloggerCommentList>().map(JSON)
				completionHandler(CommentList: CommentList, error: nil)
			}
		}
	}

	/// Access level with which to view the blog. Note that some fields require elevated access.
	public var view: BloggerBlogsView!
	/// Maximum number of posts to pull back with the blog.
	public var maxPosts: UInt!
	
	public func getBlogs(blogId blogId: String!, completionHandler: (Blog: BloggerBlog?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let maxPosts = maxPosts {
			queryParams.updateValue(maxPosts, forKey: "maxPosts")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(Blog: nil, error: error)
			} else if JSON != nil {
				let Blog = Mapper<BloggerBlog>().map(JSON)
				completionHandler(Blog: Blog, error: nil)
			}
		}
	}

	/// Access level with which to view the blogs. Note that some fields require elevated access.
	public var view: BloggerBlogsView!
	/// Blog statuses to include in the result (default: Live blogs only). Note that ADMIN access is required to view deleted blogs.
	public var status: BloggerBlogsStatus!
	/// User access types for blogs to include in the results, e.g. AUTHOR will return blogs where the user has author level access. If no roles are specified, defaults to ADMIN and AUTHOR roles.
	public var role: BloggerBlogsRole!
	/// Whether the response is a list of blogs with per-user information instead of just blogs.
	public var fetchUserInfo: Bool!
	
	public func listByUserBlogs(userId userId: String!, completionHandler: (BlogList: BloggerBlogList?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let status = status {
			queryParams.updateValue(status.rawValue, forKey: "status")
		}
		if let role = role {
			queryParams.updateValue(role.rawValue, forKey: "role")
		}
		if let fetchUserInfo = fetchUserInfo {
			queryParams.updateValue(fetchUserInfo.toJSONAndQueryString(), forKey: "fetchUserInfo")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "users/\(userId)/blogs", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(BlogList: nil, error: error)
			} else if JSON != nil {
				let BlogList = Mapper<BloggerBlogList>().map(JSON)
				completionHandler(BlogList: BlogList, error: nil)
			}
		}
	}

	/// Access level with which to view the blog. Note that some fields require elevated access.
	public var view: BloggerBlogsView!
	
	public func getByUrlBlogs(url url: String!, completionHandler: (Blog: BloggerBlog?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/byurl", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(Blog: nil, error: error)
			} else if JSON != nil {
				let Blog = Mapper<BloggerBlog>().map(JSON)
				completionHandler(Blog: Blog, error: nil)
			}
		}
	}

	/// Whether to create the page as a draft (default: false).
	public var isDraft: Bool!
	
	public func insertPages(blogId blogId: String!, completionHandler: (Page: BloggerPage?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let isDraft = isDraft {
			queryParams.updateValue(isDraft.toJSONAndQueryString(), forKey: "isDraft")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(Page: nil, error: error)
			} else if JSON != nil {
				let Page = Mapper<BloggerPage>().map(JSON)
				completionHandler(Page: Page, error: nil)
			}
		}
	}

	public func publishPages(blogId blogId: String!, pageId: String!, completionHandler: (Page: BloggerPage?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages/\(pageId)/publish", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(Page: nil, error: error)
			} else if JSON != nil {
				let Page = Mapper<BloggerPage>().map(JSON)
				completionHandler(Page: Page, error: nil)
			}
		}
	}

	public func deletePages(blogId blogId: String!, pageId: String!, completionHandler: (success: Bool?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages/\(pageId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	/// Whether a publish action should be performed when the page is updated (default: false).
	public var publish: Bool!
	/// Whether a revert action should be performed when the page is updated (default: false).
	public var revert: Bool!
	
	public func patchPages(pageId pageId: String!, blogId: String!, completionHandler: (Page: BloggerPage?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let publish = publish {
			queryParams.updateValue(publish.toJSONAndQueryString(), forKey: "publish")
		}
		if let revert = revert {
			queryParams.updateValue(revert.toJSONAndQueryString(), forKey: "revert")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages/\(pageId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(Page: nil, error: error)
			} else if JSON != nil {
				let Page = Mapper<BloggerPage>().map(JSON)
				completionHandler(Page: Page, error: nil)
			}
		}
	}

	/// Whether a publish action should be performed when the page is updated (default: false).
	public var publish: Bool!
	/// Whether a revert action should be performed when the page is updated (default: false).
	public var revert: Bool!
	
	public func updatePages(pageId pageId: String!, blogId: String!, completionHandler: (Page: BloggerPage?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let publish = publish {
			queryParams.updateValue(publish.toJSONAndQueryString(), forKey: "publish")
		}
		if let revert = revert {
			queryParams.updateValue(revert.toJSONAndQueryString(), forKey: "revert")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages/\(pageId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(Page: nil, error: error)
			} else if JSON != nil {
				let Page = Mapper<BloggerPage>().map(JSON)
				completionHandler(Page: Page, error: nil)
			}
		}
	}

	public var view: BloggerPagesView!
	
	public func getPages(blogId blogId: String!, pageId: String!, completionHandler: (Page: BloggerPage?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages/\(pageId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(Page: nil, error: error)
			} else if JSON != nil {
				let Page = Mapper<BloggerPage>().map(JSON)
				completionHandler(Page: Page, error: nil)
			}
		}
	}

	public func revertPages(blogId blogId: String!, pageId: String!, completionHandler: (Page: BloggerPage?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages/\(pageId)/revert", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(Page: nil, error: error)
			} else if JSON != nil {
				let Page = Mapper<BloggerPage>().map(JSON)
				completionHandler(Page: Page, error: nil)
			}
		}
	}

	/// Whether to retrieve the Page bodies.
	public var fetchBodies: Bool!
	/// Continuation token if the request is paged.
	public var pageToken: String!
	/// Access level with which to view the returned result. Note that some fields require elevated access.
	public var view: BloggerPagesView!
	/// Maximum number of Pages to fetch.
	public var maxResults: UInt!
	public var status: BloggerPagesStatus!
	
	public func listPages(blogId blogId: String!, completionHandler: (PageList: BloggerPageList?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let fetchBodies = fetchBodies {
			queryParams.updateValue(fetchBodies.toJSONAndQueryString(), forKey: "fetchBodies")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let maxResults = maxResults {
			queryParams.updateValue(maxResults, forKey: "maxResults")
		}
		if let status = status {
			queryParams.updateValue(status.rawValue, forKey: "status")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(PageList: nil, error: error)
			} else if JSON != nil {
				let PageList = Mapper<BloggerPageList>().map(JSON)
				completionHandler(PageList: PageList, error: nil)
			}
		}
	}

	/// Maximum number of posts to pull back with the blog.
	public var maxPosts: UInt!
	
	public func getBlogUserInfos(blogId blogId: String!, userId: String!, completionHandler: (BlogUserInfo: BloggerBlogUserInfo?, error: ErrorType?) -> ()) {
		var queryParams = setUpQueryParams()
		if let maxPosts = maxPosts {
			queryParams.updateValue(maxPosts, forKey: "maxPosts")
		}
		GoogleServiceFetcher.sharedInstance.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "users/\(userId)/blogs/\(blogId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(BlogUserInfo: nil, error: error)
			} else if JSON != nil {
				let BlogUserInfo = Mapper<BloggerBlogUserInfo>().map(JSON)
				completionHandler(BlogUserInfo: BlogUserInfo, error: nil)
			}
		}
	}

	func setUpQueryParams() -> [String: String] {
		var queryParams = [String: String]()
		if let userIp = userIp {
			queryParams.updateValue(userIp, forKey: "userIp")
		}
		if let prettyPrint = prettyPrint {
			queryParams.updateValue(prettyPrint, forKey: "prettyPrint")
		}
		if let quotaUser = quotaUser {
			queryParams.updateValue(quotaUser, forKey: "quotaUser")
		}
		if let fields = fields {
			queryParams.updateValue(fields, forKey: "fields")
		}
		if let alt = alt {
			queryParams.updateValue(alt, forKey: "alt")
		}
		if let key = key {
			queryParams.updateValue(key, forKey: "key")
		}
		if let oauthToken = oauthToken {
			queryParams.updateValue(oauthToken, forKey: "oauthToken")
		}
		return queryParams
	}
}

public enum BloggerAlt: String {
	case Json = "json"
}

public enum BloggerPostUserInfosStatus: String {
	case Draft = "draft"
	case Live = "live"
	case Scheduled = "scheduled"
}

public enum BloggerPostUserInfosView: String {
	case ADMIN = "ADMIN"
	case AUTHOR = "AUTHOR"
	case READER = "READER"
}

public enum BloggerPostUserInfosOrderBy: String {
	case Published = "published"
	case Updated = "updated"
}

public enum BloggerPageViewsRange: String {
	case X30DAYS = "30DAYS"
	case X7DAYS = "7DAYS"
	case All = "all"
}

public enum BloggerPostsView: String {
	case ADMIN = "ADMIN"
	case AUTHOR = "AUTHOR"
	case READER = "READER"
}

public enum BloggerPostsOrderBy: String {
	case Published = "published"
	case Updated = "updated"
}

public enum BloggerPostsStatus: String {
	case Draft = "draft"
	case Live = "live"
	case Scheduled = "scheduled"
}

public enum BloggerCommentsView: String {
	case ADMIN = "ADMIN"
	case AUTHOR = "AUTHOR"
	case READER = "READER"
}

public enum BloggerCommentsStatus: String {
	case Emptied = "emptied"
	case Live = "live"
	case Pending = "pending"
	case Spam = "spam"
}

public enum BloggerBlogsView: String {
	case ADMIN = "ADMIN"
	case AUTHOR = "AUTHOR"
	case READER = "READER"
}

public enum BloggerBlogsStatus: String {
	case DELETED = "DELETED"
	case LIVE = "LIVE"
}

public enum BloggerBlogsRole: String {
	case ADMIN = "ADMIN"
	case AUTHOR = "AUTHOR"
	case READER = "READER"
}

public enum BloggerPagesView: String {
	case ADMIN = "ADMIN"
	case AUTHOR = "AUTHOR"
	case READER = "READER"
}

public enum BloggerPagesStatus: String {
	case Draft = "draft"
	case Live = "live"
}

public enum BloggerOAuthScopes: String {
	case Readonly = "https://www.googleapis.com/auth/blogger.readonly"
	case Blogger = "https://www.googleapis.com/auth/blogger"
}

