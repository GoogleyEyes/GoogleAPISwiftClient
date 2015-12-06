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
    var accessToken: String? {
        didSet {
            apiKey = nil
        }
    }
    var apiKey: String? {
        didSet {
            accessToken = nil
        }
    }

    static let sharedInstance : GoogleServiceFetcher = GoogleServiceFetcher()
    private init() {

    }

    func performRequest(method: Alamofire.Method = .GET, serviceName: String, apiVersion: String, endpoint: String, queryParams: [String: String], completionHandler: (JSON: String?, error: ErrorType?) -> ()) {
        let url = baseURL + "/\(serviceName)/\(apiVersion)/\(endpoint)"
        var finalQueryParams = queryParams
        if accessToken != nil {
            let manager = Manager.sharedInstance
            manager.session.configuration.HTTPAdditionalHeaders = ["Authorization": "Bearer \(accessToken!)"]
        } else if apiKey != nil {
            finalQueryParams.updateValue(apiKey!, forKey: "key")
        }
        Alamofire.request(method, url, parameters: finalQueryParams)
            .validate()
            .responseString { response in
                if response.result.isFailure {
                    completionHandler(JSON: nil, error: response.result.error)
                } else {
                    completionHandler(JSON: response.result.value, error: nil)
                }
            }
    }
}
