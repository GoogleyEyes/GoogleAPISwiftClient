//
//  YoutubeGuideCategory.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// A guideCategory resource identifies a category that YouTube algorithmically assigns based on a channel's content or other indicators, such as the channel's popularity. The list is similar to video categories, with the difference being that a video's uploader can assign a video category but only YouTube can assign a channel category.
public class YoutubeGuideCategory: GoogleObject {
	/// The snippet object contains basic details about the category, such as its title.
	public var snippet: YoutubeGuideCategorySnippet!
	/// Etag of this resource.
	public var etag: String!
	/// The ID that YouTube uses to uniquely identify the guide category.
	public var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#guideCategory".
	public var kind: String = "youtube#guideCategory"
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		kind <- map["kind"]
	}
}

