//
//  YoutubeGeoPoint.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 12/18/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeGeoPoint: Mappable {
	/// Latitude in degrees.
	public var latitude: Double!
	/// Longitude in degrees.
	public var longitude: Double!
	/// Altitude above the reference ellipsoid, in meters.
	public var altitude: Double!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		latitude <- map["latitude"]
		longitude <- map["longitude"]
		altitude <- map["altitude"]
	}
}

