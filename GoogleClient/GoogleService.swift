//
//  GoogleService.swift
//  GoogleClient
//
//  Created by Matthew Wyskiel on 5/18/15.
//  Copyright (c) 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import Alamofire

protocol GoogleService {
    var apiNameInURL: String {
        get
    }
    /** begins with 'v' followed by number */
    var apiVersionString: String {
        get
    }
    var accessToken: String? { get set }
    var apiKey: String? { get set }
}

class GoogleServiceFetcher {
    let baseURL = "https://www.googleapis.com"
    var accessToken: String?
    var apiKey: String?

    static let sharedInstance : GoogleServiceFetcher = GoogleServiceFetcher()
    private init() {

    }

    func performRequest(method: Alamofire.Method = .GET, serviceName: String, apiVersion: String, endpoint: String, queryParams: [String: String], completionHandler: (JSON: String?, error: NSError?) -> ()) {
        var url = baseURL + "/\(serviceName)/\(apiVersion)/\(endpoint)"
        var finalQueryParams = queryParams
        if accessToken != nil {
            var manager = Manager.sharedInstance
            manager.session.configuration.HTTPAdditionalHeaders = ["Authorization": "Bearer \(accessToken!)"]
        } else if apiKey != nil {
            finalQueryParams.updateValue(apiKey!, forKey: "key")
        }
        Alamofire.request(method, url, parameters: finalQueryParams)
            .validate()
            .responseString { (request, response, data, error) -> Void in
                if error != nil {
                    completionHandler(JSON: nil, error: error)
                } else if data != nil {
                    completionHandler(JSON: data, error: nil)
                }
            }
    }
}
