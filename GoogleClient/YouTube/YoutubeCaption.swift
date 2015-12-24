//
//  YoutubeCaption.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

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

	public func mapping(map: Map) {
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		kind <- map["kind"]
	}
}

