//
//  YoutubeInvideoPosition.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeInvideoPosition: Mappable {
	/// Describes in which corner of the video the visual widget will appear.
	public var cornerPosition: YoutubeInvideoPositionCornerPosition!
	/// Defines the position type.
	public var type: YoutubeInvideoPositionType!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		cornerPosition <- map["cornerPosition"]
		type <- map["type"]
	}
}

