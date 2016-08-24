//
//  YoutubeGeoPoint.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Geographical coordinates of a point, in WGS84.
public class YoutubeGeoPoint: ObjectType {
	/// Latitude in degrees.
	public var latitude: Double!
	/// Longitude in degrees.
	public var longitude: Double!
	/// Altitude above the reference ellipsoid, in meters.
	public var altitude: Double!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		latitude <- map["latitude"]
		longitude <- map["longitude"]
		altitude <- map["altitude"]
	}
}

