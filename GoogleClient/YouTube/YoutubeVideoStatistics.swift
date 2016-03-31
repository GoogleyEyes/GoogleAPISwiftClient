//
//  YoutubeVideoStatistics.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/31/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeVideoStatistics: ObjectType {
	/// The number of users who have indicated that they liked the video by giving it a positive rating.
	public var likeCount: UInt64!
	/// The number of times the video has been viewed.
	public var viewCount: UInt64!
	/// The number of users who currently have the video marked as a favorite video.
	public var favoriteCount: UInt64!
	/// The number of comments for the video.
	public var commentCount: UInt64!
	/// The number of users who have indicated that they disliked the video by giving it a negative rating.
	public var dislikeCount: UInt64!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		likeCount <- map["likeCount"]
		viewCount <- map["viewCount"]
		favoriteCount <- map["favoriteCount"]
		commentCount <- map["commentCount"]
		dislikeCount <- map["dislikeCount"]
	}
}

