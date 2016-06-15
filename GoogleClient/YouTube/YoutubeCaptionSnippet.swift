//
//  YoutubeCaptionSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The caption track's type.
public enum YoutubeCaptionSnippetTrackKind: String {
	/// 
	case ASR = "ASR"
	/// 
	case Forced = "forced"
	/// 
	case Standard = "standard"
}

/// The CaptionSnippet model type for use with the Youtube API
public class YoutubeCaptionSnippet: ObjectType {
	/// Indicates whether the caption track is a draft. If the value is true, then the track is not publicly visible. The default value is false.
	public var isDraft: Bool!
	/// The reason that YouTube failed to process the caption track. This property is only present if the state property's value is failed.
	public var failureReason: YoutubeCaptionSnippetFailureReason!
	/// Indicates whether YouTube synchronized the caption track to the audio track in the video. The value will be true if a sync was explicitly requested when the caption track was uploaded. For example, when calling the captions.insert or captions.update methods, you can set the sync parameter to true to instruct YouTube to sync the uploaded track to the video. If the value is false, YouTube uses the time codes in the uploaded caption track to determine when to display captions.
	public var isAutoSynced: Bool!
	/// The ID that YouTube uses to uniquely identify the video associated with the caption track.
	public var videoId: String!
	/// The name of the caption track. The name is intended to be visible to the user as an option during playback.
	public var name: String!
	/// The date and time when the caption track was last updated. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var lastUpdated: Date!
	/// Indicates whether caption track is formatted for "easy reader," meaning it is at a third-grade level for language learners. The default value is false.
	public var isEasyReader: Bool!
	/// Indicates whether the track contains closed captions for the deaf and hard of hearing. The default value is false.
	public var isCC: Bool!
	/// The caption track's type.
	public var trackKind: YoutubeCaptionSnippetTrackKind!
	/// The type of audio track associated with the caption track.
	public var audioTrackType: YoutubeCaptionSnippetAudioTrackType!
	/// Indicates whether the caption track uses large text for the vision-impaired. The default value is false.
	public var isLarge: Bool!
	/// The caption track's status.
	public var status: YoutubeCaptionSnippetStatus!
	/// The language of the caption track. The property value is a BCP-47 language tag.
	public var language: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		isDraft <- map["isDraft"]
		failureReason <- map["failureReason"]
		isAutoSynced <- map["isAutoSynced"]
		videoId <- map["videoId"]
		name <- map["name"]
		lastUpdated <- (map["lastUpdated"], RFC3339Transform())
		isEasyReader <- map["isEasyReader"]
		isCC <- map["isCC"]
		trackKind <- map["trackKind"]
		audioTrackType <- map["audioTrackType"]
		isLarge <- map["isLarge"]
		status <- map["status"]
		language <- map["language"]
	}
}

/// The reason that YouTube failed to process the caption track. This property is only present if the state property's value is failed.
public enum YoutubeCaptionSnippetFailureReason: String {
	/// 
	case ProcessingFailed = "processingFailed"
	/// 
	case UnknownFormat = "unknownFormat"
	/// 
	case UnsupportedFormat = "unsupportedFormat"
}

/// The type of audio track associated with the caption track.
public enum YoutubeCaptionSnippetAudioTrackType: String {
	/// 
	case Commentary = "commentary"
	/// 
	case Descriptive = "descriptive"
	/// 
	case Primary = "primary"
	/// 
	case Unknown = "unknown"
}

/// The caption track's status.
public enum YoutubeCaptionSnippetStatus: String {
	/// 
	case Failed = "failed"
	/// 
	case Serving = "serving"
	/// 
	case Syncing = "syncing"
}

