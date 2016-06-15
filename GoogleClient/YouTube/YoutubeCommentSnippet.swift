//
//  YoutubeCommentSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The comment's moderation status. Will not be set if the comments were requested through the id filter.
public enum YoutubeCommentSnippetModerationStatus: String {
	/// 
	case HeldForReview = "heldForReview"
	/// 
	case LikelySpam = "likelySpam"
	/// 
	case Published = "published"
	/// 
	case Rejected = "rejected"
}

/// The rating the viewer has given to this comment. For the time being this will never return RATE_TYPE_DISLIKE and instead return RATE_TYPE_NONE. This may change in the future.
public enum YoutubeCommentSnippetViewerRating: String {
	/// 
	case Dislike = "dislike"
	/// 
	case Like = "like"
	/// 
	case None = "none"
	/// 
	case Unspecified = "unspecified"
}

/// The CommentSnippet model type for use with the Youtube API
public class YoutubeCommentSnippet: ObjectType {
	/// The date and time when was last updated . The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var updatedAt: Date!
	/// The id of the corresponding YouTube channel. In case of a channel comment this is the channel the comment refers to. In case of a video comment it's the video's channel.
	public var channelId: String!
	/// Link to the author's Google+ profile, if any.
	public var authorGoogleplusProfileUrl: String!
	/// The comment's moderation status. Will not be set if the comments were requested through the id filter.
	public var moderationStatus: YoutubeCommentSnippetModerationStatus!
	/// The comment's original raw text as initially posted or last updated. The original text will only be returned if it is accessible to the viewer, which is only guaranteed if the viewer is the comment's author.
	public var textOriginal: String!
	/// The rating the viewer has given to this comment. For the time being this will never return RATE_TYPE_DISLIKE and instead return RATE_TYPE_NONE. This may change in the future.
	public var viewerRating: YoutubeCommentSnippetViewerRating!
	/// The comment's text. The format is either plain text or HTML dependent on what has been requested. Even the plain text representation may differ from the text originally posted in that it may replace video links with video titles etc.
	public var textDisplay: String!
	/// The id of the author's YouTube channel, if any.
	public var authorChannelId: Any!
	/// The ID of the video the comment refers to, if any.
	public var videoId: String!
	/// The date and time when the comment was orignally published. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var publishedAt: Date!
	/// The total number of likes this comment has received.
	public var likeCount: UInt!
	/// The unique id of the parent comment, only set for replies.
	public var parentId: String!
	/// Link to the author's YouTube channel, if any.
	public var authorChannelUrl: String!
	/// Whether the current viewer can rate this comment.
	public var canRate: Bool!
	/// The name of the user who posted the comment.
	public var authorDisplayName: String!
	/// The URL for the avatar of the user who posted the comment.
	public var authorProfileImageUrl: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		updatedAt <- (map["updatedAt"], RFC3339Transform())
		channelId <- map["channelId"]
		authorGoogleplusProfileUrl <- map["authorGoogleplusProfileUrl"]
		moderationStatus <- map["moderationStatus"]
		textOriginal <- map["textOriginal"]
		viewerRating <- map["viewerRating"]
		textDisplay <- map["textDisplay"]
		authorChannelId <- map["authorChannelId"]
		videoId <- map["videoId"]
		publishedAt <- (map["publishedAt"], RFC3339Transform())
		likeCount <- map["likeCount"]
		parentId <- map["parentId"]
		authorChannelUrl <- map["authorChannelUrl"]
		canRate <- map["canRate"]
		authorDisplayName <- map["authorDisplayName"]
		authorProfileImageUrl <- map["authorProfileImageUrl"]
	}
}

