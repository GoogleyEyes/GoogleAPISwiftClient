//
//  YoutubeVideoConversionPing.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeVideoConversionPing: Mappable {
	/// Defines the context of the ping.
	public var context: YoutubeVideoConversionPingContext!
	/// The url (without the schema) that the app shall send the ping to. It's at caller's descretion to decide which schema to use (http vs https) Example of a returned url: //googleads.g.doubleclick.net/pagead/ viewthroughconversion/962985656/?data=path%3DtHe_path%3Btype%3D like%3Butuid%3DGISQtTNGYqaYl4sKxoVvKA%3Bytvid%3DUrIaJUvIQDg&labe=default The caller must append biscotti authentication (ms param in case of mobile, for example) to this ping.
	public var conversionUrl: String!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		context <- map["context"]
		conversionUrl <- map["conversionUrl"]
	}
}

