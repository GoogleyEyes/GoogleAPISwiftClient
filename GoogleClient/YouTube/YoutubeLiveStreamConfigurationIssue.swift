//
//  YoutubeLiveStreamConfigurationIssue.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLiveStreamConfigurationIssue: ObjectType {
	/// The short-form reason for this issue.
	public var reason: String!
	/// The long-form description of the issue and how to resolve it.
	public var description: String!
	/// How severe this issue is to the stream.
	public var severity: YoutubeLiveStreamConfigurationIssueSeverity!
	/// The kind of error happening.
	public var type: YoutubeLiveStreamConfigurationIssueType!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		reason <- map["reason"]
		description <- map["description"]
		severity <- map["severity"]
		type <- map["type"]
	}
}

public enum YoutubeLiveStreamConfigurationIssueSeverity: String {
	case Error = "error"
	case Info = "info"
	case Warning = "warning"
}

public enum YoutubeLiveStreamConfigurationIssueType: String {
	case AudioBitrateHigh = "audioBitrateHigh"
	case AudioBitrateLow = "audioBitrateLow"
	case AudioBitrateMismatch = "audioBitrateMismatch"
	case AudioCodec = "audioCodec"
	case AudioCodecMismatch = "audioCodecMismatch"
	case AudioSampleRate = "audioSampleRate"
	case AudioSampleRateMismatch = "audioSampleRateMismatch"
	case AudioStereoMismatch = "audioStereoMismatch"
	case AudioTooManyChannels = "audioTooManyChannels"
	case BadContainer = "badContainer"
	case BitrateHigh = "bitrateHigh"
	case BitrateLow = "bitrateLow"
	case FrameRateHigh = "frameRateHigh"
	case FramerateMismatch = "framerateMismatch"
	case GopMismatch = "gopMismatch"
	case GopSizeLong = "gopSizeLong"
	case GopSizeOver = "gopSizeOver"
	case GopSizeShort = "gopSizeShort"
	case InterlacedVideo = "interlacedVideo"
	case MultipleAudioStreams = "multipleAudioStreams"
	case MultipleVideoStreams = "multipleVideoStreams"
	case NoAudioStream = "noAudioStream"
	case NoVideoStream = "noVideoStream"
	case OpenGop = "openGop"
	case ResolutionMismatch = "resolutionMismatch"
	case VideoBitrateMismatch = "videoBitrateMismatch"
	case VideoCodec = "videoCodec"
	case VideoCodecMismatch = "videoCodecMismatch"
	case VideoIngestionStarved = "videoIngestionStarved"
	case VideoInterlaceMismatch = "videoInterlaceMismatch"
	case VideoProfileMismatch = "videoProfileMismatch"
	case VideoResolutionSuboptimal = "videoResolutionSuboptimal"
	case VideoResolutionUnsupported = "videoResolutionUnsupported"
}

