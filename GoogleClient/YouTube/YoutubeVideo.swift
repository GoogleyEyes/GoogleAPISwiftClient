//
//  YoutubeVideo.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The Video model type for use with the Youtube API
public class YoutubeVideo: GoogleObject {
	/// The liveStreamingDetails object contains metadata about a live video broadcast. The object will only be present in a video resource if the video is an upcoming, live, or completed live broadcast.
	public var liveStreamingDetails: YoutubeVideoLiveStreamingDetails!
	/// The suggestions object encapsulates suggestions that identify opportunities to improve the video quality or the metadata for the uploaded video. This data can only be retrieved by the video owner.
	public var suggestions: YoutubeVideoSuggestions!
	/// Age restriction details related to a video. This data can only be retrieved by the video owner.
	public var ageGating: YoutubeVideoAgeGating!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#video".
	public var kind: String = "youtube#video"
	/// The contentDetails object contains information about the video content, including the length of the video and its aspect ratio.
	public var contentDetails: YoutubeVideoContentDetails!
	/// The snippet object contains basic details about the video, such as its title, description, and category.
	public var snippet: YoutubeVideoSnippet!
	/// Etag of this resource.
	public var etag: String!
	/// The fileDetails object encapsulates information about the video file that was uploaded to YouTube, including the file's resolution, duration, audio and video codecs, stream bitrates, and more. This data can only be retrieved by the video owner.
	public var fileDetails: YoutubeVideoFileDetails!
	/// The statistics object contains statistics about the video.
	public var statistics: YoutubeVideoStatistics!
	/// The topicDetails object encapsulates information about Freebase topics associated with the video.
	public var topicDetails: YoutubeVideoTopicDetails!
	/// The ID that YouTube uses to uniquely identify the video.
	public var id: String!
	/// The recordingDetails object encapsulates information about the location, date and address where the video was recorded.
	public var recordingDetails: YoutubeVideoRecordingDetails!
	/// The player object contains information that you would use to play the video in an embedded player.
	public var player: YoutubeVideoPlayer!
	/// The monetizationDetails object encapsulates information about the monetization status of the video.
	public var monetizationDetails: YoutubeVideoMonetizationDetails!
	/// List with all localizations.
	public var localizations: [String: YoutubeVideoLocalization]!
	/**
	The processingProgress object encapsulates information about YouTube's progress in processing the uploaded video file. The properties in the object identify the current processing status and an estimate of the time remaining until YouTube finishes processing the video. This part also indicates whether different types of data or content, such as file details or thumbnail images, are available for the video.
	
	The processingProgress object is designed to be polled so that the video uploaded can track the progress that YouTube has made in processing the uploaded video file. This data can only be retrieved by the video owner.*/
	public var processingDetails: YoutubeVideoProcessingDetails!
	/// The projectDetails object contains information about the project specific video metadata.
	public var projectDetails: YoutubeVideoProjectDetails!
	/// The status object contains information about the video's uploading, processing, and privacy statuses.
	public var status: YoutubeVideoStatus!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		liveStreamingDetails <- map["liveStreamingDetails"]
		suggestions <- map["suggestions"]
		ageGating <- map["ageGating"]
		kind <- map["kind"]
		contentDetails <- map["contentDetails"]
		snippet <- map["snippet"]
		etag <- map["etag"]
		fileDetails <- map["fileDetails"]
		statistics <- map["statistics"]
		topicDetails <- map["topicDetails"]
		id <- map["id"]
		recordingDetails <- map["recordingDetails"]
		player <- map["player"]
		monetizationDetails <- map["monetizationDetails"]
		localizations <- map["localizations"]
		processingDetails <- map["processingDetails"]
		projectDetails <- map["projectDetails"]
		status <- map["status"]
	}
}

