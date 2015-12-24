//
//  YoutubePromotedItemId.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubePromotedItemId: Mappable {
	/// If the promoted item represents a video, this field represents the unique YouTube ID identifying it. This field will be present only if type has the value video.
	public var videoId: String!
	/// If type is recentUpload, this field identifies the channel from which to take the recent upload. If missing, the channel is assumed to be the same channel for which the invideoPromotion is set.
	public var recentlyUploadedBy: String!
	/// If the promoted item represents a website, this field represents the url pointing to the website. This field will be present only if type has the value website.
	public var websiteUrl: String!
	/// Describes the type of the promoted item.
	public var type: YoutubePromotedItemIdType!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		videoId <- map["videoId"]
		recentlyUploadedBy <- map["recentlyUploadedBy"]
		websiteUrl <- map["websiteUrl"]
		type <- map["type"]
	}
}

