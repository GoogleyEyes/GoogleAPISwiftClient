//
//  YoutubeVideoContentDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The value of definition indicates whether the video is available in high definition or only in standard definition.
public enum YoutubeVideoContentDetailsDefinition: String {
	/// 
	case Hd = "hd"
	/// 
	case Sd = "sd"
}

/// Details about the content of a YouTube Video.
public class YoutubeVideoContentDetails: ObjectType {
	/// The value of definition indicates whether the video is available in high definition or only in standard definition.
	public var definition: YoutubeVideoContentDetailsDefinition!
	/// The countryRestriction object contains information about the countries where a video is (or is not) viewable.
	public var countryRestriction: YoutubeAccessPolicy!
	/// The value of is_license_content indicates whether the video is licensed content.
	public var licensedContent: Bool!
	/// Specifies the ratings that the video received under various rating schemes.
	public var contentRating: YoutubeContentRating!
	/// The regionRestriction object contains information about the countries where a video is (or is not) viewable. The object will contain either the contentDetails.regionRestriction.allowed property or the contentDetails.regionRestriction.blocked property.
	public var regionRestriction: YoutubeVideoContentDetailsRegionRestriction!
	/// The value of dimension indicates whether the video is available in 3D or in 2D.
	public var dimension: String!
	/// The length of the video. The tag value is an ISO 8601 duration in the format PT#M#S, in which the letters PT indicate that the value specifies a period of time, and the letters M and S refer to length in minutes and seconds, respectively. The # characters preceding the M and S letters are both integers that specify the number of minutes (or seconds) of the video. For example, a value of PT15M51S indicates that the video is 15 minutes and 51 seconds long.
	public var duration: String!
	/// Specifies the projection format of the video.
	public var projection: YoutubeVideoContentDetailsProjection!
	/// The value of captions indicates whether the video has captions or not.
	public var caption: YoutubeVideoContentDetailsCaption!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		definition <- map["definition"]
		countryRestriction <- map["countryRestriction"]
		licensedContent <- map["licensedContent"]
		contentRating <- map["contentRating"]
		regionRestriction <- map["regionRestriction"]
		dimension <- map["dimension"]
		duration <- map["duration"]
		projection <- map["projection"]
		caption <- map["caption"]
	}
}

/// The value of captions indicates whether the video has captions or not.
public enum YoutubeVideoContentDetailsCaption: String {
	/// 
	case False = "false"
	/// 
	case True = "true"
}

/// Specifies the projection format of the video.
public enum YoutubeVideoContentDetailsProjection: String {
	/// 
	case X360 = "360"
	/// 
	case Rectangular = "rectangular"
}

