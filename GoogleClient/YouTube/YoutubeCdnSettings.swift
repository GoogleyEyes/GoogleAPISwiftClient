//
//  YoutubeCdnSettings.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The CdnSettings model type for use with the Youtube API
public class YoutubeCdnSettings: ObjectType {
	/// The resolution of the inbound video data.
	public var resolution: YoutubeCdnSettingsResolution!
	/// The method or protocol used to transmit the video stream.
	public var ingestionType: YoutubeCdnSettingsIngestionType!
	/// The frame rate of the inbound video data.
	public var frameRate: YoutubeCdnSettingsFrameRate!
	/// The ingestionInfo object contains information that YouTube provides that you need to transmit your RTMP or HTTP stream to YouTube.
	public var ingestionInfo: YoutubeIngestionInfo!
	/// The format of the video stream that you are sending to Youtube.
	public var format: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		resolution <- map["resolution"]
		ingestionType <- map["ingestionType"]
		frameRate <- map["frameRate"]
		ingestionInfo <- map["ingestionInfo"]
		format <- map["format"]
	}
}

/// The frame rate of the inbound video data.
public enum YoutubeCdnSettingsFrameRate: String {
	/// 
	case X30fps = "30fps"
	/// 
	case X60fps = "60fps"
}

/// The method or protocol used to transmit the video stream.
public enum YoutubeCdnSettingsIngestionType: String {
	/// 
	case Dash = "dash"
	/// 
	case Rtmp = "rtmp"
}

/// The resolution of the inbound video data.
public enum YoutubeCdnSettingsResolution: String {
	/// 
	case X1080p = "1080p"
	/// 
	case X1440p = "1440p"
	/// 
	case X240p = "240p"
	/// 
	case X360p = "360p"
	/// 
	case X480p = "480p"
	/// 
	case X720p = "720p"
}

