//
//  YoutubeVideoProjectDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeVideoProjectDetails: ObjectType {
	/// A list of project tags associated with the video during the upload.
	public var tags: [String]!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		tags <- map["tags"]
	}
}

