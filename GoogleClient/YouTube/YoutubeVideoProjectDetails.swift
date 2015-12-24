//
//  YoutubeVideoProjectDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeVideoProjectDetails: Mappable {
	/// A list of project tags associated with the video during the upload.
	public var tags: [String]!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		tags <- map["tags"]
	}
}

