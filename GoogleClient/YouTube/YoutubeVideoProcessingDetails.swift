//
//  YoutubeVideoProcessingDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeVideoProcessingDetails: Mappable {
	/// The processingProgress object contains information about the progress YouTube has made in processing the video. The values are really only relevant if the video's processing status is processing.
	public var processingProgress: YoutubeVideoProcessingDetailsProcessingProgress!
	/// The reason that YouTube failed to process the video. This property will only have a value if the processingStatus property's value is failed.
	public var processingFailureReason: YoutubeVideoProcessingDetailsProcessingFailureReason!
	/// This value indicates whether keyword (tag) suggestions are available for the video. Tags can be added to a video's metadata to make it easier for other users to find the video. You can retrieve these suggestions by requesting the suggestions part in your videos.list() request.
	public var tagSuggestionsAvailability: String!
	/// This value indicates whether the video processing engine has generated suggestions that might improve YouTube's ability to process the the video, warnings that explain video processing problems, or errors that cause video processing problems. You can retrieve these suggestions by requesting the suggestions part in your videos.list() request.
	public var processingIssuesAvailability: String!
	/// This value indicates whether file details are available for the uploaded video. You can retrieve a video's file details by requesting the fileDetails part in your videos.list() request.
	public var fileDetailsAvailability: String!
	/// This value indicates whether thumbnail images have been generated for the video.
	public var thumbnailsAvailability: String!
	/// The video's processing status. This value indicates whether YouTube was able to process the video or if the video is still being processed.
	public var processingStatus: YoutubeVideoProcessingDetailsProcessingStatus!
	/// This value indicates whether video editing suggestions, which might improve video quality or the playback experience, are available for the video. You can retrieve these suggestions by requesting the suggestions part in your videos.list() request.
	public var editorSuggestionsAvailability: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		processingProgress <- map["processingProgress"]
		processingFailureReason <- map["processingFailureReason"]
		tagSuggestionsAvailability <- map["tagSuggestionsAvailability"]
		processingIssuesAvailability <- map["processingIssuesAvailability"]
		fileDetailsAvailability <- map["fileDetailsAvailability"]
		thumbnailsAvailability <- map["thumbnailsAvailability"]
		processingStatus <- map["processingStatus"]
		editorSuggestionsAvailability <- map["editorSuggestionsAvailability"]
	}
}

