//
//  YoutubeVideoStatus.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeVideoStatus: Mappable {
	/// The video's privacy status.
	public var privacyStatus: YoutubeVideoStatusPrivacyStatus!
	/// This value indicates if the video can be embedded on another website.
	public var embeddable: Bool!
	/// This value indicates if the extended video statistics on the watch page can be viewed by everyone. Note that the view count, likes, etc will still be visible if this is disabled.
	public var publicStatsViewable: Bool!
	/// The video's license.
	public var license: YoutubeVideoStatusLicense!
	/// This value explains why a video failed to upload. This property is only present if the uploadStatus property indicates that the upload failed.
	public var failureReason: YoutubeVideoStatusFailureReason!
	/// This value explains why YouTube rejected an uploaded video. This property is only present if the uploadStatus property indicates that the upload was rejected.
	public var rejectionReason: YoutubeVideoStatusRejectionReason!
	/// The status of the uploaded video.
	public var uploadStatus: YoutubeVideoStatusUploadStatus!
	/// The date and time when the video is scheduled to publish. It can be set only if the privacy status of the video is private. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	public var publishAt: NSDate!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		privacyStatus <- map["privacyStatus"]
		embeddable <- map["embeddable"]
		publicStatsViewable <- map["publicStatsViewable"]
		license <- map["license"]
		failureReason <- map["failureReason"]
		rejectionReason <- map["rejectionReason"]
		uploadStatus <- map["uploadStatus"]
		publishAt <- (map["publishAt"], RFC3339Transform())
	}
}

