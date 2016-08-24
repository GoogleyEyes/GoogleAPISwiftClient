//
//  YoutubeActivityContentDetailsUpload.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Information about the uploaded video.
public class YoutubeActivityContentDetailsUpload: ObjectType {
	/// The ID that YouTube uses to uniquely identify the uploaded video.
	public var videoId: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		videoId <- map["videoId"]
	}
}

