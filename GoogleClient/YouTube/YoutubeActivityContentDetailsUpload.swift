//
//  YoutubeActivityContentDetailsUpload.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ActivityContentDetailsUpload model type for use with the Youtube API
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

