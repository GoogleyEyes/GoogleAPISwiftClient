//
//  YoutubeSponsor.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

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

	public func mapping(map: Map) {
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		kind <- map["kind"]
	}
}

