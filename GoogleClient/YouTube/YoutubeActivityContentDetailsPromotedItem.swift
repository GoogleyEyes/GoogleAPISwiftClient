//
//  YoutubeActivityContentDetailsPromotedItem.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 3/30/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public enum YoutubeActivityContentDetailsPromotedItemCtaType: String {
	case Unspecified = "unspecified"
	case VisitAdvertiserSite = "visitAdvertiserSite"
}

public class YoutubeActivityContentDetailsPromotedItem: ObjectType {
	/// The list of forecasting URLs. The client should ping all of these URLs when a promoted item is not available, to indicate that a promoted item could have been shown.
	public var forecastingUrl: [String]!
	/// The URL the client should direct the user to, if the user chooses to visit the advertiser's website.
	public var destinationUrl: String!
	/// The type of call-to-action, a message to the user indicating action that can be taken.
	public var ctaType: YoutubeActivityContentDetailsPromotedItemCtaType!
	/// The URL the client should ping to indicate that the user was shown this promoted item.
	public var creativeViewUrl: String!
	/// The text description to accompany the promoted item.
	public var descriptionText: String!
	/// The custom call-to-action button text. If specified, it will override the default button text for the cta_type.
	public var customCtaButtonText: String!
	/// The ID that YouTube uses to uniquely identify the promoted video.
	public var videoId: String!
	/// The list of impression URLs. The client should ping all of these URLs to indicate that the user was shown this promoted item.
	public var impressionUrl: [String]!
	/// The URL the client should ping to indicate that the user clicked through on this promoted item.
	public var clickTrackingUrl: String!
	/// The URL the client should fetch to request a promoted item.
	public var adTag: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(map: Map) {
		forecastingUrl <- map["forecastingUrl"]
		destinationUrl <- map["destinationUrl"]
		ctaType <- map["ctaType"]
		creativeViewUrl <- map["creativeViewUrl"]
		descriptionText <- map["descriptionText"]
		customCtaButtonText <- map["customCtaButtonText"]
		videoId <- map["videoId"]
		impressionUrl <- map["impressionUrl"]
		clickTrackingUrl <- map["clickTrackingUrl"]
		adTag <- map["adTag"]
	}
}

