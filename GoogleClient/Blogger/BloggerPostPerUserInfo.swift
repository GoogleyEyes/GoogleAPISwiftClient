//
//  BloggerPostPerUserInfo.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/11/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class BloggerPostPerUserInfo: GoogleObject {
	/// ID of the User.
	public var userId: String!
	/// True if the user has Author level access to the post.
	public var hasEditAccess: Bool!
	/// ID of the Blog that the post resource belongs to.
	public var blogId: String!
	/// ID of the Post resource.
	public var postId: String!
	/// The kind of this entity. Always blogger#postPerUserInfo
	public var kind: String = "blogger#postPerUserInfo"
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		userId <- map["userId"]
		hasEditAccess <- map["hasEditAccess"]
		blogId <- map["blogId"]
		postId <- map["postId"]
		kind <- map["kind"]
	}
}

