//
//  YoutubeSearchResult.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// A search result contains information about a YouTube video, channel, or playlist that matches the search parameters specified in an API request. While a search result points to a uniquely identifiable resource, like a video, it does not have its own persistent data.
public class YoutubeSearchResult: GoogleObject {
	/// The snippet object contains basic details about a search result, such as its title or description. For example, if the search result is a video, then the title will be the video's title and the description will be the video's description.
	public var snippet: YoutubeSearchResultSnippet!
	/// Etag of this resource.
	public var etag: String!
	/// The id object contains information that can be used to uniquely identify the resource that matches the search request.
	public var id: YoutubeResourceId!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#searchResult".
	public var kind: String = "youtube#searchResult"
	
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

