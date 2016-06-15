//
//  YoutubeVideoFileDetailsAudioStream.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The VideoFileDetailsAudioStream model type for use with the Youtube API
public class YoutubeVideoFileDetailsAudioStream: ObjectType {
	/// The number of audio channels that the stream contains.
	public var channelCount: UInt!
	/// The audio stream's bitrate, in bits per second.
	public var bitrateBps: UInt64!
	/// A value that uniquely identifies a video vendor. Typically, the value is a four-letter vendor code.
	public var vendor: String!
	/// The audio codec that the stream uses.
	public var codec: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		channelCount <- map["channelCount"]
		bitrateBps <- map["bitrateBps"]
		vendor <- map["vendor"]
		codec <- map["codec"]
	}
}

