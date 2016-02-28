//
//  YoutubeChannelConversionPing.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeChannelConversionPing: ObjectType {
	/// Defines the context of the ping.
	public var context: YoutubeChannelConversionPingContext!
	/// The url (without the schema) that the player shall send the ping to. It's at caller's descretion to decide which schema to use (http vs https) Example of a returned url: //googleads.g.doubleclick.net/pagead/ viewthroughconversion/962985656/?data=path%3DtHe_path%3Btype%3D cview%3Butuid%3DGISQtTNGYqaYl4sKxoVvKA&labe=default The caller must append biscotti authentication (ms param in case of mobile, for example) to this ping.
	public var conversionUrl: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		context <- map["context"]
		conversionUrl <- map["conversionUrl"]
	}
}

public enum YoutubeChannelConversionPingContext: String {
	case Cview = "cview"
	case Subscribe = "subscribe"
	case Unsubscribe = "unsubscribe"
}

