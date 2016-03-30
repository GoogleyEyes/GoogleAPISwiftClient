//
//  YoutubeChannelAuditDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeChannelAuditDetails: ObjectType {
	/// Describes the general state of the channel. This field will always show if there are any issues whatsoever with the channel. Currently this field represents the result of the logical and operation over the community guidelines good standing, the copyright strikes good standing and the content ID claims good standing, but this may change in the future.
	public var overallGoodStanding: Bool!
	/// Whether or not the channel has any unresolved claims.
	public var contentIdClaimsGoodStanding: Bool!
	/// Whether or not the channel has any copyright strikes.
	public var copyrightStrikesGoodStanding: Bool!
	/// Whether or not the channel respects the community guidelines.
	public var communityGuidelinesGoodStanding: Bool!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		overallGoodStanding <- map["overallGoodStanding"]
		contentIdClaimsGoodStanding <- map["contentIdClaimsGoodStanding"]
		copyrightStrikesGoodStanding <- map["copyrightStrikesGoodStanding"]
		communityGuidelinesGoodStanding <- map["communityGuidelinesGoodStanding"]
	}
}

