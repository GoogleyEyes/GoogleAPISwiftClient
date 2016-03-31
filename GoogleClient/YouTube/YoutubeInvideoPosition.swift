//
//  YoutubeInvideoPosition.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/31/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeInvideoPosition: ObjectType {
	/// Describes in which corner of the video the visual widget will appear.
	public var cornerPosition: YoutubeInvideoPositionCornerPosition!
	/// Defines the position type.
	public var type: YoutubeInvideoPositionType!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		cornerPosition <- map["cornerPosition"]
		type <- map["type"]
	}
}

public enum YoutubeInvideoPositionType: String {
	case Corner = "corner"
}

public enum YoutubeInvideoPositionCornerPosition: String {
	case BottomLeft = "bottomLeft"
	case BottomRight = "bottomRight"
	case TopLeft = "topLeft"
	case TopRight = "topRight"
}

