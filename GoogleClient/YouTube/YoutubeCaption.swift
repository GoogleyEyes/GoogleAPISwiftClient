//
//  YoutubeCaption.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// A caption resource represents a YouTube caption track. A caption track is associated with exactly one YouTube video.
public class YoutubeCaption: GoogleObject {
	/// The snippet object contains basic details about the caption.
	public var snippet: YoutubeCaptionSnippet!
	/// Etag of this resource.
	public var etag: String!
	/// The ID that YouTube uses to uniquely identify the caption track.
	public var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#caption".
	public var kind: String = "youtube#caption"
	
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

