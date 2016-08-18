//
//  Blogger.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// 
public enum BloggerPostUserInfosStatus: String {
	/// Draft posts
	case Draft = "draft"
	/// Published posts
	case Live = "live"
	/// Posts that are scheduled to publish in future.
	case Scheduled = "scheduled"
}

/// Data format for the response.
public enum BloggerAlt: String {
	/// Responses with Content-Type of application/json
	case JSON = "json"
}

/// Statuses to include in the results.
public enum BloggerPostsStatus: String {
	/// Draft (non-published) posts.
	case Draft = "draft"
	/// Published posts
	case Live = "live"
	/// Posts that are scheduled to publish in the future.
	case Scheduled = "scheduled"
}

/// Access level with which to view the returned result. Note that some fields require escalated access.
public enum BloggerPostsView: String {
	/// Admin level detail
	case Admin = "ADMIN"
	/// Author level detail
	case Author = "AUTHOR"
	/// Reader level detail
	case Reader = "READER"
}

/// Access level with which to view the blog. Note that some fields require elevated access.
public enum BloggerBlogsView: String {
	/// Admin level detail.
	case Admin = "ADMIN"
	/// Author level detail.
	case Author = "AUTHOR"
	/// Reader level detail.
	case Reader = "READER"
}

/// Sort order applied to search results. Default is published.
public enum BloggerPostUserInfosOrderBy: String {
	/// Order by the date the post was published
	case Published = "published"
	/// Order by the date the post was last updated
	case Updated = "updated"
}

/// 
public enum BloggerPagesStatus: String {
	/// Draft (unpublished) Pages
	case Draft = "draft"
	/// Pages that are publicly visible
	case Live = "live"
}

/// Blog statuses to include in the result (default: Live blogs only). Note that ADMIN access is required to view deleted blogs.
public enum BloggerBlogsStatus: String {
	/// Blog has been deleted by an administrator.
	case Deleted = "DELETED"
	/// Blog is currently live.
	case Live = "LIVE"
}

/// Access level with which to view the returned result. Note that some fields require elevated access.
public enum BloggerPagesView: String {
	/// Admin level detail
	case Admin = "ADMIN"
	/// Author level detail
	case Author = "AUTHOR"
	/// Reader level detail
	case Reader = "READER"
}

/// Scopes for OAuth 2.0 authorization
public enum BloggerOAuthScopes: String {
	/// View your Blogger account
	case Readonly = "https://www.googleapis.com/auth/blogger.readonly"
	/// Manage your Blogger account
	case Blogger = "https://www.googleapis.com/auth/blogger"
}

/// Sort search results
public enum BloggerPostsOrderBy: String {
	/// Order by the date the post was published
	case Published = "published"
	/// Order by the date the post was last updated
	case Updated = "updated"
}

/// Access level with which to view the returned result. Note that some fields require elevated access.
public enum BloggerCommentsView: String {
	/// Admin level detail
	case Admin = "ADMIN"
	/// Author level detail
	case Author = "AUTHOR"
	/// Reader level detail
	case Reader = "READER"
}

/// Access level with which to view the returned result. Note that some fields require elevated access.
public enum BloggerPostUserInfosView: String {
	/// Admin level detail
	case Admin = "ADMIN"
	/// Author level detail
	case Author = "AUTHOR"
	/// Reader level detail
	case Reader = "READER"
}

/// User access types for blogs to include in the results, e.g. AUTHOR will return blogs where the user has author level access. If no roles are specified, defaults to ADMIN and AUTHOR roles.
public enum BloggerBlogsRole: String {
	/// Admin role - Blogs where the user has Admin level access.
	case Admin = "ADMIN"
	/// Author role - Blogs where the user has Author level access.
	case Author = "AUTHOR"
	/// Reader role - Blogs where the user has Reader level access (to a private blog).
	case Reader = "READER"
}

/// 
public enum BloggerPageViewsRange: String {
	/// Page view counts from the last thirty days.
	case X30Days = "30DAYS"
	/// Page view counts from the last seven days.
	case X7Days = "7DAYS"
	/// Total page view counts from all time.
	case All = "all"
}

/// 
public enum BloggerCommentsStatus: String {
	/// Comments that have had their content removed
	case Emptied = "emptied"
	/// Comments that are publicly visible
	case Live = "live"
	/// Comments that are awaiting administrator approval
	case Pending = "pending"
	/// Comments marked as spam by the administrator
	case Spam = "spam"
}

/// API for access to the data within Blogger.
public class Blogger: GoogleService {
	var apiNameInURL: String = "blogger"
	var apiVersionString: String = "v3"

	public let fetcher: GoogleServiceFetcher = GoogleServiceFetcher()

	public required init() {

	}

	/// IP address of the site where the request originates. Use this if you want to enforce per-user limits.
	public var userIp: String!
	/// Returns response with indentations and line breaks.
	public var prettyPrint: Bool = true
	/// Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. Overrides userIp if both are provided.
	public var quotaUserId: String!
	/// Selector specifying which fields to include in a partial response.
	public var fields: String!
	/// Data format for the response.
	public var alt: BloggerAlt = .JSON
	
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
	public var orderBy: BloggerPostUserInfosOrderBy = .Published
	/// Maximum number of posts to fetch.
	public var maxResults: UInt!
	/// Earliest post date to fetch, a date-time with RFC 3339 formatting.
	public var startDate: NSDate!
	
	/// Retrieves a list of post and post user info pairs, possibly filtered. The post user info contains per-user information about the post, such as access rights, specific to the user.
	public func listPostUserInfos(forUserId userId: String, blogId: String, completionHandler: (postUserInfosList: BloggerPostUserInfosList?, error: NSError?) -> ()) {
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
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "users/\(userId)/blogs/\(blogId)/posts", queryParams: queryParams) { (JSON, error) -> () in
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
	
	/// Gets one post and user info pair, by post ID and user ID. The post user info contains per-user information about the post, such as access rights, specific to the user.
	public func getPostUserInfo(forUserId userId: String, blogId: String, postId: String, completionHandler: (postUserInfo: BloggerPostUserInfo?, error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let maxComments = maxComments {
			queryParams.updateValue(maxComments.toJSONString(), forKey: "maxComments")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "users/\(userId)/blogs/\(blogId)/posts/\(postId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(postUserInfo: nil, error: error)
			} else if JSON != nil {
				let postUserInfo = Mapper<BloggerPostUserInfo>().map(JSON)
				completionHandler(postUserInfo: postUserInfo, error: nil)
			}
		}
	}

	public var range: BloggerPageViewsRange!
	
	/// Retrieve pageview stats for a Blog.
	public func getPageViews(forBlogWithId blogId: String, completionHandler: (pageviews: BloggerPageviews?, error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let range = range {
			queryParams.updateValue(range.rawValue, forKey: "range")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pageviews", queryParams: queryParams) { (JSON, error) -> () in
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
	
	/// Add a post.
	public func insertPost(post: BloggerPost, toBlogWithId blogId: String, completionHandler: (post: BloggerPost?, error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let isDraft = isDraft {
			queryParams.updateValue(isDraft.toJSONString(), forKey: "isDraft")
		}
		queryParams.updateValue(fetchBody.toJSONString(), forKey: "fetchBody")
		if let fetchImages = fetchImages {
			queryParams.updateValue(fetchImages.toJSONString(), forKey: "fetchImages")
		}
		fetcher.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts", queryParams: queryParams, postBody: Mapper<BloggerPost>().toJSON(post)) { (JSON, error) -> () in
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
	
	/// Publishes a draft post, optionally at the specific time of the given publishDate parameter.
	public func publishPost(withId postId: String, toBlogWithId blogId: String, completionHandler: (post: BloggerPost?, error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let publishDate = publishDate {
			queryParams.updateValue(publishDate.toJSONString(), forKey: "publishDate")
		}
		fetcher.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/publish", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(post: nil, error: error)
			} else if JSON != nil {
				let post = Mapper<BloggerPost>().map(JSON)
				completionHandler(post: post, error: nil)
			}
		}
	}

	/// Delete a post by ID.
	public func deletePost(withId postId: String, fromBlogWithId blogId: String, completionHandler: (success: Bool, error: NSError?) -> ()) {
		let queryParams = setUpQueryParams()
		fetcher.performRequest(.DELETE, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)", queryParams: queryParams) { (JSON, error) -> () in
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
	
	/// Update a post. This method supports patch semantics.
	public func patchPost(post: BloggerPost, forPostID postId: String, blogId: String, completionHandler: (post: BloggerPost?, error: NSError?) -> ()) {
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
		fetcher.performRequest(.PATCH, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)", queryParams: queryParams, postBody: Mapper<BloggerPost>().toJSON(post)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(post: nil, error: error)
			} else if JSON != nil {
				let post = Mapper<BloggerPost>().map(JSON)
				completionHandler(post: post, error: nil)
			}
		}
	}

	/// Retrieve a Post by Path.
	public func getPost(byPath path: String, blogId: String, completionHandler: (post: BloggerPost?, error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(path, forKey: "path")
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let maxComments = maxComments {
			queryParams.updateValue(maxComments.toJSONString(), forKey: "maxComments")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/bypath", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(post: nil, error: error)
			} else if JSON != nil {
				let post = Mapper<BloggerPost>().map(JSON)
				completionHandler(post: post, error: nil)
			}
		}
	}

	/// Update a post.
	public func updatePost(post: BloggerPost, withPostId postId: String, blogId: String, completionHandler: (post: BloggerPost?, error: NSError?) -> ()) {
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
		fetcher.performRequest(.PUT, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)", queryParams: queryParams, postBody: Mapper<BloggerPost>().toJSON(post)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(post: nil, error: error)
			} else if JSON != nil {
				let post = Mapper<BloggerPost>().map(JSON)
				completionHandler(post: post, error: nil)
			}
		}
	}

	/// Get a post by ID.
	public func getPost(withId postId: String, blogId: String, completionHandler: (post: BloggerPost?, error: NSError?) -> ()) {
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
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(post: nil, error: error)
			} else if JSON != nil {
				let post = Mapper<BloggerPost>().map(JSON)
				completionHandler(post: post, error: nil)
			}
		}
	}

	/// Revert a published or scheduled post to draft state.
	public func revertPost(withId postId: String, blogId: String, completionHandler: (post: BloggerPost?, error: NSError?) -> ()) {
		let queryParams = setUpQueryParams()
		fetcher.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/revert", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(post: nil, error: error)
			} else if JSON != nil {
				let post = Mapper<BloggerPost>().map(JSON)
				completionHandler(post: post, error: nil)
			}
		}
	}

	/// Search for a post.
	public func searchPosts(query q: String, blogId: String, completionHandler: (postList: BloggerPostList?, error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(fetchBodies.toJSONString(), forKey: "fetchBodies")
		queryParams.updateValue(orderBy.rawValue, forKey: "orderBy")
		queryParams.updateValue(q, forKey: "q")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/search", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(postList: nil, error: error)
			} else if JSON != nil {
				let postList = Mapper<BloggerPostList>().map(JSON)
				completionHandler(postList: postList, error: nil)
			}
		}
	}

	/// Retrieves a list of posts, possibly filtered.
	public func listPosts(blogId blogId: String, completionHandler: (postList: BloggerPostList?, error: NSError?) -> ()) {
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
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(postList: nil, error: error)
			} else if JSON != nil {
				let postList = Mapper<BloggerPostList>().map(JSON)
				completionHandler(postList: postList, error: nil)
			}
		}
	}

	/// Gets one user by ID.
	public func getUser(withId userId: String, completionHandler: (user: BloggerUser?, error: NSError?) -> ()) {
		let queryParams = setUpQueryParams()
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "users/\(userId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(user: nil, error: error)
			} else if JSON != nil {
				let user = Mapper<BloggerUser>().map(JSON)
				completionHandler(user: user, error: nil)
			}
		}
	}

	/// Marks a comment as spam.
	public func markCommentAsSpam(withId commentId: String, inPostWithId postId: String, blogId: String, completionHandler: (comment: BloggerComment?, error: NSError?) -> ()) {
		let queryParams = setUpQueryParams()
		fetcher.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments/\(commentId)/spam", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(comment: nil, error: error)
			} else if JSON != nil {
				let comment = Mapper<BloggerComment>().map(JSON)
				completionHandler(comment: comment, error: nil)
			}
		}
	}

	/// Removes the content of a comment.
	public func removeContentFromComment(withId commentId: String, inPostWithId postId: String, blogId: String, completionHandler: (comment: BloggerComment?, error: NSError?) -> ()) {
		let queryParams = setUpQueryParams()
		fetcher.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments/\(commentId)/removecontent", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(comment: nil, error: error)
			} else if JSON != nil {
				let comment = Mapper<BloggerComment>().map(JSON)
				completionHandler(comment: comment, error: nil)
			}
		}
	}

	/// Delete a comment by ID.
	public func deleteComment(withId commentId: String, fromPostWithId postId: String, blogId: String, completionHandler: (success: Bool?, error: NSError?) -> ()) {
		let queryParams = setUpQueryParams()
		fetcher.performRequest(.DELETE, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments/\(commentId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	/// Gets one comment by ID.
	public func getComment(forId commentId: String, postId: String, blogId: String, completionHandler: (comment: BloggerComment?, error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments/\(commentId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(comment: nil, error: error)
			} else if JSON != nil {
				let comment = Mapper<BloggerComment>().map(JSON)
				completionHandler(comment: comment, error: nil)
			}
		}
	}

	/// Retrieves the comments for a post, possibly filtered.
	public func listComments(forPostWithId postId: String, blogId: String, completionHandler: (commentList: BloggerCommentList?, error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(fetchBodies.toJSONString(), forKey: "fetchBodies")
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
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(commentList: nil, error: error)
			} else if JSON != nil {
				let commentList = Mapper<BloggerCommentList>().map(JSON)
				completionHandler(commentList: commentList, error: nil)
			}
		}
	}

	/// Marks a comment as not spam.
	public func approveComment(withId commentId: String, forPostWithId postId: String, blogId: String, completionHandler: (comment: BloggerComment?, error: NSError?) -> ()) {
		let queryParams = setUpQueryParams()
		fetcher.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments/\(commentId)/approve", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(comment: nil, error: error)
			} else if JSON != nil {
				let comment = Mapper<BloggerComment>().map(JSON)
				completionHandler(comment: comment, error: nil)
			}
		}
	}

	/// Retrieves the comments for a blog, across all posts, possibly filtered.
	public func listComments(forBlogWithId blogId: String, completionHandler: (commentList: BloggerCommentList?, error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(fetchBodies.toJSONString(), forKey: "fetchBodies")
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
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/comments", queryParams: queryParams) { (JSON, error) -> () in
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
	
	/// Gets one blog by ID.
	public func getBlog(forId blogId: String, completionHandler: (blog: BloggerBlog?, error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let maxPosts = maxPosts {
			queryParams.updateValue(maxPosts.toJSONString(), forKey: "maxPosts")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)", queryParams: queryParams) { (JSON, error) -> () in
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
	
	/// Retrieves a list of blogs, possibly filtered.
	public func listBlogs(forUserWithId userId: String, completionHandler: (blogList: BloggerBlogList?, error: NSError?) -> ()) {
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
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "users/\(userId)/blogs", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(blogList: nil, error: error)
			} else if JSON != nil {
				let blogList = Mapper<BloggerBlogList>().map(JSON)
				completionHandler(blogList: blogList, error: nil)
			}
		}
	}

	/// Retrieve a Blog by URL.
	public func getBlog(fromURL url: String, completionHandler: (blog: BloggerBlog?, error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		queryParams.updateValue(url, forKey: "url")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/byurl", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(blog: nil, error: error)
			} else if JSON != nil {
				let blog = Mapper<BloggerBlog>().map(JSON)
				completionHandler(blog: blog, error: nil)
			}
		}
	}

	/// Add a page.
	public func insertPage(page: BloggerPage, toBlogWithId blogId: String, completionHandler: (page: BloggerPage?, error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let isDraft = isDraft {
			queryParams.updateValue(isDraft.toJSONString(), forKey: "isDraft")
		}
		fetcher.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages", queryParams: queryParams, postBody: Mapper<BloggerPage>().toJSON(page)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(page: nil, error: error)
			} else if JSON != nil {
				let page = Mapper<BloggerPage>().map(JSON)
				completionHandler(page: page, error: nil)
			}
		}
	}

	/// Publishes a draft page.
	public func publishPage(withId pageId: String, toBlogWithId blogId: String, completionHandler: (page: BloggerPage?, error: NSError?) -> ()) {
		let queryParams = setUpQueryParams()
		fetcher.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages/\(pageId)/publish", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(page: nil, error: error)
			} else if JSON != nil {
				let page = Mapper<BloggerPage>().map(JSON)
				completionHandler(page: page, error: nil)
			}
		}
	}

	/// Delete a page by ID.
	public func deletePage(withId pageId: String, fromBlogWithId blogId: String, completionHandler: (success: Bool, error: NSError?) -> ()) {
		let queryParams = setUpQueryParams()
		fetcher.performRequest(.DELETE, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages/\(pageId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(success: false, error: error)
			} else {
				completionHandler(success: true, error: nil)
			}
		}
	}

	/// Update a page. This method supports patch semantics.
	public func patchPage(page: BloggerPage, forPageWithId pageId: String, blogId: String, completionHandler: (page: BloggerPage?, error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let publish = publish {
			queryParams.updateValue(publish.toJSONString(), forKey: "publish")
		}
		if let revert = revert {
			queryParams.updateValue(revert.toJSONString(), forKey: "revert")
		}
		fetcher.performRequest(.PATCH, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages/\(pageId)", queryParams: queryParams, postBody: Mapper<BloggerPage>().toJSON(page)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(page: nil, error: error)
			} else if JSON != nil {
				let page = Mapper<BloggerPage>().map(JSON)
				completionHandler(page: page, error: nil)
			}
		}
	}

	/// Update a page.
	public func updatePage(page: BloggerPage, forPageWithId pageId: String, blogId: String, completionHandler: (page: BloggerPage?, error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let publish = publish {
			queryParams.updateValue(publish.toJSONString(), forKey: "publish")
		}
		if let revert = revert {
			queryParams.updateValue(revert.toJSONString(), forKey: "revert")
		}
		fetcher.performRequest(.PUT, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages/\(pageId)", queryParams: queryParams, postBody: Mapper<BloggerPage>().toJSON(page)) { (JSON, error) -> () in
			if error != nil {
				completionHandler(page: nil, error: error)
			} else if JSON != nil {
				let page = Mapper<BloggerPage>().map(JSON)
				completionHandler(page: page, error: nil)
			}
		}
	}

	/// Gets one blog page by ID.
	public func getPage(forId pageId: String, fromBlogWithId blogId: String, completionHandler: (page: BloggerPage?, error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages/\(pageId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(page: nil, error: error)
			} else if JSON != nil {
				let page = Mapper<BloggerPage>().map(JSON)
				completionHandler(page: page, error: nil)
			}
		}
	}

	/// Revert a published or scheduled page to draft state.
	public func revertPage(withId pageId: String, inBlogWithId blogId: String, completionHandler: (page: BloggerPage?, error: NSError?) -> ()) {
		let queryParams = setUpQueryParams()
		fetcher.performRequest(.POST, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages/\(pageId)/revert", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(page: nil, error: error)
			} else if JSON != nil {
				let page = Mapper<BloggerPage>().map(JSON)
				completionHandler(page: page, error: nil)
			}
		}
	}

	/// Retrieves the pages for a blog, optionally including non-LIVE statuses.
	public func listPages(forBlogWithId blogId: String, completionHandler: (pageList: BloggerPageList?, error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(fetchBodies.toJSONString(), forKey: "fetchBodies")
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
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(pageList: nil, error: error)
			} else if JSON != nil {
				let pageList = Mapper<BloggerPageList>().map(JSON)
				completionHandler(pageList: pageList, error: nil)
			}
		}
	}

	/// Gets one blog and user info pair by blogId and userId.
	public func getBlogUserInfo(forBlogWithId blogId: String, userId: String, completionHandler: (blogUserInfo: BloggerBlogUserInfo?, error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let maxPosts = maxPosts {
			queryParams.updateValue(maxPosts.toJSONString(), forKey: "maxPosts")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "users/\(userId)/blogs/\(blogId)", queryParams: queryParams) { (JSON, error) -> () in
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
		if let quotaUserId = quotaUserId {
			queryParams.updateValue(quotaUserId, forKey: "quotaUser")
		}
		if let fields = fields {
			queryParams.updateValue(fields, forKey: "fields")
		}
		queryParams.updateValue(alt.rawValue, forKey: "alt")
		return queryParams
	}
}

