//
//  BloggerBlogPerUserInfo.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/12/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The BlogPerUserInfo model type for use with the Blogger API
public class BloggerBlogPerUserInfo: GoogleObject {
	/// ID of the User
	public var userId: String!
	/// The Photo Album Key for the user when adding photos to the blog
	public var photosAlbumKey: String!
	/// True if the user has Admin level access to the blog.
	public var hasAdminAccess: Bool!
	/// Access permissions that the user has for the blog (ADMIN, AUTHOR, or READER).
	public var role: String!
	/// ID of the Blog resource
	public var blogId: String!
	/// The kind of this entity. Always blogger#blogPerUserInfo
	public var kind: String = "blogger#blogPerUserInfo"
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		userId <- map["userId"]
		photosAlbumKey <- map["photosAlbumKey"]
		hasAdminAccess <- map["hasAdminAccess"]
		role <- map["role"]
		blogId <- map["blogId"]
		kind <- map["kind"]
	}
}

