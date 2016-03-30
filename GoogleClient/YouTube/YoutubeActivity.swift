//
//  YoutubeActivity.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeActivity: GoogleObject {
	/// The contentDetails object contains information about the content associated with the activity. For example, if the snippet.type value is videoRated, then the contentDetails object's content identifies the rated video.
	public var contentDetails: YoutubeActivityContentDetails!
	/// The snippet object contains basic details about the activity, including the activity's type and group ID.
	public var snippet: YoutubeActivitySnippet!
	/// Etag of this resource.
	public var etag: String!
	/// The ID that YouTube uses to uniquely identify the activity.
	public var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#activity".
	public var kind: String = "youtube#activity"
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		contentDetails <- map["contentDetails"]
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		kind <- map["kind"]
	}
}

