//
//  YoutubeInvideoPosition.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Describes the spatial position of a visual widget inside a video. It is a union of various position types, out of which only will be set one.
public class YoutubeInvideoPosition: ObjectType {
	/// Describes in which corner of the video the visual widget will appear.
	public var cornerPosition: YoutubeInvideoPositionCornerPosition!
	/// Defines the position type.
	public var type: YoutubeInvideoPositionType!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		cornerPosition <- map["cornerPosition"]
		type <- map["type"]
	}
}

/// Defines the position type.
public enum YoutubeInvideoPositionType: String {
	/// 
	case Corner = "corner"
}

/// Describes in which corner of the video the visual widget will appear.
public enum YoutubeInvideoPositionCornerPosition: String {
	/// 
	case BottomLeft = "bottomLeft"
	/// 
	case BottomRight = "bottomRight"
	/// 
	case TopLeft = "topLeft"
	/// 
	case TopRight = "topRight"
}

