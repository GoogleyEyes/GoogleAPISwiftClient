//
//  BloggerPostUserInfo.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The PostUserInfo model type for use with the Blogger API
public class BloggerPostUserInfo: GoogleObject {
	/// The Post resource.
	public var post: BloggerPost!
	/// Information about a User for the Post.
	public var postUserInfo: BloggerPostPerUserInfo!
	/// The kind of this entity. Always blogger#postUserInfo
	public var kind: String = "blogger#postUserInfo"
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		post <- map["post"]
		postUserInfo <- map["post_user_info"]
		kind <- map["kind"]
	}
}

