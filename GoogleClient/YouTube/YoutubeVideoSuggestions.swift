//
//  YoutubeVideoSuggestions.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/31/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeVideoSuggestions: ObjectType {
	/// A list of reasons why YouTube may have difficulty transcoding the uploaded video or that might result in an erroneous transcoding. These warnings are generated before YouTube actually processes the uploaded video file. In addition, they identify issues that are unlikely to cause the video processing to fail but that might cause problems such as sync issues, video artifacts, or a missing audio track.
	public var processingWarnings: [String]!
	/// A list of errors that will prevent YouTube from successfully processing the uploaded video video. These errors indicate that, regardless of the video's current processing status, eventually, that status will almost certainly be failed.
	public var processingErrors: [String]!
	/// A list of suggestions that may improve YouTube's ability to process the video.
	public var processingHints: [String]!
	/// A list of keyword tags that could be added to the video's metadata to increase the likelihood that users will locate your video when searching or browsing on YouTube.
	public var tagSuggestions: [YoutubeVideoSuggestionsTagSuggestion]!
	/// A list of video editing operations that might improve the video quality or playback experience of the uploaded video.
	public var editorSuggestions: [String]!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		processingWarnings <- map["processingWarnings"]
		processingErrors <- map["processingErrors"]
		processingHints <- map["processingHints"]
		tagSuggestions <- map["tagSuggestions"]
		editorSuggestions <- map["editorSuggestions"]
	}
}

