//
//  YoutubeSponsor.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// A sponsor resource represents a sponsor for a YouTube channel. A sponsor provides recurring monetary support to a creator and receives special benefits.
public class YoutubeSponsor: GoogleObject {
	/// The snippet object contains basic details about the sponsor.
	public var snippet: YoutubeSponsorSnippet!
	/// Etag of this resource.
	public var etag: String!
	/// The ID that YouTube assigns to uniquely identify the sponsor.
	public var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#sponsor".
	public var kind: String = "youtube#sponsor"
	
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

