//
//  YoutubeVideoCategory.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The VideoCategory model type for use with the Youtube API
public class YoutubeVideoCategory: GoogleObject {
	/// The snippet object contains basic details about the video category, including its title.
	public var snippet: YoutubeVideoCategorySnippet!
	/// Etag of this resource.
	public var etag: String!
	/// The ID that YouTube uses to uniquely identify the video category.
	public var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#videoCategory".
	public var kind: String = "youtube#videoCategory"
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		kind <- map["kind"]
	}
}

