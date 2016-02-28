//
//  YoutubeActivityContentDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeActivityContentDetails: ObjectType {
	/// The channelItem object contains details about a resource which was added to a channel. This property is only present if the snippet.type is channelItem.
	public var channelItem: YoutubeActivityContentDetailsChannelItem!
	/// The like object contains information about a resource that received a positive (like) rating. This property is only present if the snippet.type is like.
	public var like: YoutubeActivityContentDetailsLike!
	/// The bulletin object contains details about a channel bulletin post. This object is only present if the snippet.type is bulletin.
	public var bulletin: YoutubeActivityContentDetailsBulletin!
	/// The upload object contains information about the uploaded video. This property is only present if the snippet.type is upload.
	public var upload: YoutubeActivityContentDetailsUpload!
	/// The favorite object contains information about a video that was marked as a favorite video. This property is only present if the snippet.type is favorite.
	public var favorite: YoutubeActivityContentDetailsFavorite!
	/// The comment object contains information about a resource that received a comment. This property is only present if the snippet.type is comment.
	public var comment: YoutubeActivityContentDetailsComment!
	/// The playlistItem object contains information about a new playlist item. This property is only present if the snippet.type is playlistItem.
	public var playlistItem: YoutubeActivityContentDetailsPlaylistItem!
	/// The recommendation object contains information about a recommended resource. This property is only present if the snippet.type is recommendation.
	public var recommendation: YoutubeActivityContentDetailsRecommendation!
	/// The subscription object contains information about a channel that a user subscribed to. This property is only present if the snippet.type is subscription.
	public var subscription: YoutubeActivityContentDetailsSubscription!
	/// The promotedItem object contains details about a resource which is being promoted. This property is only present if the snippet.type is promotedItem.
	public var promotedItem: YoutubeActivityContentDetailsPromotedItem!
	/// The social object contains details about a social network post. This property is only present if the snippet.type is social.
	public var social: YoutubeActivityContentDetailsSocial!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		channelItem <- map["channelItem"]
		like <- map["like"]
		bulletin <- map["bulletin"]
		upload <- map["upload"]
		favorite <- map["favorite"]
		comment <- map["comment"]
		playlistItem <- map["playlistItem"]
		recommendation <- map["recommendation"]
		subscription <- map["subscription"]
		promotedItem <- map["promotedItem"]
		social <- map["social"]
	}
}

