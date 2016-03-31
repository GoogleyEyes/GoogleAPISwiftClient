//
//  YoutubeVideoFileDetailsVideoStream.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/31/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public enum YoutubeVideoFileDetailsVideoStreamRotation: String {
	case Clockwise = "clockwise"
	case CounterClockwise = "counterClockwise"
	case None = "none"
	case Other = "other"
	case UpsideDown = "upsideDown"
}

public class YoutubeVideoFileDetailsVideoStream: ObjectType {
	/// The video stream's frame rate, in frames per second.
	public var frameRateFps: Double!
	/// A value that uniquely identifies a video vendor. Typically, the value is a four-letter vendor code.
	public var vendor: String!
	/// The video codec that the stream uses.
	public var codec: String!
	/// The video content's display aspect ratio, which specifies the aspect ratio in which the video should be displayed.
	public var aspectRatio: Double!
	/// The amount that YouTube needs to rotate the original source content to properly display the video.
	public var rotation: YoutubeVideoFileDetailsVideoStreamRotation!
	/// The encoded video content's height in pixels.
	public var heightPixels: UInt!
	/// The video stream's bitrate, in bits per second.
	public var bitrateBps: UInt64!
	/// The encoded video content's width in pixels. You can calculate the video's encoding aspect ratio as width_pixels / height_pixels.
	public var widthPixels: UInt!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		frameRateFps <- map["frameRateFps"]
		vendor <- map["vendor"]
		codec <- map["codec"]
		aspectRatio <- map["aspectRatio"]
		rotation <- map["rotation"]
		heightPixels <- map["heightPixels"]
		bitrateBps <- map["bitrateBps"]
		widthPixels <- map["widthPixels"]
	}
}

