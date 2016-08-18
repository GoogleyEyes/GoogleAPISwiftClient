//
//  YoutubeVideoCategory.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// A videoCategory resource identifies a category that has been or could be associated with uploaded videos.
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

