//
//  YoutubeVideoProcessingDetailsProcessingProgress.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeVideoProcessingDetailsProcessingProgress: ObjectType {
	/// An estimate of the total number of parts that need to be processed for the video. The number may be updated with more precise estimates while YouTube processes the video.
	public var partsTotal: UInt64!
	/**
	The number of parts of the video that YouTube has already processed. You can estimate the percentage of the video that YouTube has already processed by calculating:
	100 * parts_processed / parts_total
	
	Note that since the estimated number of parts could increase without a corresponding increase in the number of parts that have already been processed, it is possible that the calculated progress could periodically decrease while YouTube processes a video.*/
	public var partsProcessed: UInt64!
	/// An estimate of the amount of time, in millseconds, that YouTube needs to finish processing the video.
	public var timeLeftMs: UInt64!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		partsTotal <- map["partsTotal"]
		partsProcessed <- map["partsProcessed"]
		timeLeftMs <- map["timeLeftMs"]
	}
}

