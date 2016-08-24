//
//  YoutubePropertyValue.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// A pair Property / Value.
public class YoutubePropertyValue: ObjectType {
	/// The property's value.
	public var value: String!
	/// A property.
	public var property: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		value <- map["value"]
		property <- map["property"]
	}
}

