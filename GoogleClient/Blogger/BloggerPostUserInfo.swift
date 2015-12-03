//
//  BloggerPostUserInfo.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 10/19/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class BloggerPostUserInfo: GoogleObject {
	/// The Post resource.
	public var post: BloggerPost!
	/// Information about a User for the Post.
	public var postUserInfo: BloggerPostPerUserInfo!
	/// The kind of this entity. Always blogger#postUserInfo
	public var kind: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		post <- map["post"]
		postUserInfo <- map["post_user_info"]
		kind <- map["kind"]
	}

