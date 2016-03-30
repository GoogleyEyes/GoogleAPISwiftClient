//
//  YoutubeVideoFileDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeVideoFileDetails: ObjectType {
	/// The uploaded file's type as detected by YouTube's video processing engine. Currently, YouTube only processes video files, but this field is present whether a video file or another type of file was uploaded.
	public var fileType: YoutubeVideoFileDetailsFileType!
	/// A list of video streams contained in the uploaded video file. Each item in the list contains detailed metadata about a video stream.
	public var videoStreams: [YoutubeVideoFileDetailsVideoStream]!
	/// The length of the uploaded video in milliseconds.
	public var durationMs: UInt64!
	/// The uploaded file's name. This field is present whether a video file or another type of file was uploaded.
	public var fileName: String!
	/// Geographic coordinates that identify the place where the uploaded video was recorded. Coordinates are defined using WGS 84.
	public var recordingLocation: YoutubeGeoPoint!
	/// A list of audio streams contained in the uploaded video file. Each item in the list contains detailed metadata about an audio stream.
	public var audioStreams: [YoutubeVideoFileDetailsAudioStream]!
	/// The uploaded file's size in bytes. This field is present whether a video file or another type of file was uploaded.
	public var fileSize: UInt64!
	/// The uploaded video file's container format.
	public var container: String!
	/// The uploaded video file's combined (video and audio) bitrate in bits per second.
	public var bitrateBps: UInt64!
	/**
	The date and time when the uploaded video file was created. The value is specified in ISO 8601 format. Currently, the following ISO 8601 formats are supported:  
	- Date only: YYYY-MM-DD 
	- Naive time: YYYY-MM-DDTHH:MM:SS 
	- Time with timezone: YYYY-MM-DDTHH:MM:SS+HH:MM*/
	public var creationTime: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		fileType <- map["fileType"]
		videoStreams <- map["videoStreams"]
		durationMs <- map["durationMs"]
		fileName <- map["fileName"]
		recordingLocation <- map["recordingLocation"]
		audioStreams <- map["audioStreams"]
		fileSize <- map["fileSize"]
		container <- map["container"]
		bitrateBps <- map["bitrateBps"]
		creationTime <- map["creationTime"]
	}
}

public enum YoutubeVideoFileDetailsFileType: String {
	case Archive = "archive"
	case Audio = "audio"
	case Document = "document"
	case Image = "image"
	case Other = "other"
	case Project = "project"
	case Video = "video"
}

