//
//  YoutubeActivityContentDetailsUpload.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeActivityContentDetailsUpload: Mappable {
	/// The ID that YouTube uses to uniquely identify the uploaded video.
	public var videoId: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		videoId <- map["videoId"]
	}
}

