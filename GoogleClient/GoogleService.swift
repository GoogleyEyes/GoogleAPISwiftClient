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
            if apiKey != nil {
                apiKey = nil
            }
        }
    }
    var apiKey: String? {
        didSet {
            if accessToken != nil {
                accessToken = nil
            }
        }
    }

    static let sharedInstance : GoogleServiceFetcher = GoogleServiceFetcher()
    private init() {

    }

    func performRequest(method: Alamofire.Method = .GET, serviceName: String, apiVersion: String, endpoint: String, queryParams: [String: String], postBody: [String: AnyObject]? = nil, completionHandler: (JSON: [String: AnyObject]?, error: ErrorType?) -> ()) {
        let url = baseURL + "/\(serviceName)/\(apiVersion)/\(endpoint)"
        var finalQueryParams = queryParams
        var headers: [String: String] = [:]
        if accessToken != nil {
            headers = ["Authorization": "Bearer \(accessToken!)"]
        } else if apiKey != nil {
            finalQueryParams.updateValue(apiKey!, forKey: "key")
        }
        let request = multiEncodedURLRequest(method, URLString: url, URLParameters: queryParams, bodyParameters: postBody, headers: headers)
        Alamofire.request(request)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success(let value):
                    completionHandler(JSON: value as? [String : AnyObject], error: nil)
                case .Failure(let error):
                    let alamofireError = error
                    if let responseData = response.data {
                        do {
                            let JSON = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions(rawValue: 0)) as! [String: AnyObject]
                            let errJSON = JSON["error"] as! [String: AnyObject]
                            let errSpecifics = errJSON["errors"]![0] as! [String: AnyObject]
                            let errorObj = NSError(domain: errSpecifics["domain"] as! String, code: errJSON["code"] as! Int, userInfo: errSpecifics)

                            completionHandler(JSON: nil, error: errorObj)
                        } catch {
                            completionHandler(JSON: nil, error: alamofireError)
                        }

                    }
                }
        }
    }

    func multiEncodedURLRequest(
        method: Alamofire.Method,
        URLString: URLStringConvertible,
        URLParameters: [String: AnyObject],
        bodyParameters: [String: AnyObject]?,
        headers: [String: String]) -> NSURLRequest
    {
        let tempURLRequest = NSURLRequest(URL: NSURL(string: URLString.URLString)!)
        let URLRequest = ParameterEncoding.URL.encode(tempURLRequest, parameters: URLParameters)
        let bodyRequest = ParameterEncoding.JSON.encode(tempURLRequest, parameters: bodyParameters)

        let compositeRequest = URLRequest.0.mutableCopy() as! NSMutableURLRequest
        compositeRequest.HTTPMethod = method.rawValue
        compositeRequest.HTTPBody = bodyRequest.0.HTTPBody
        for (key, value) in headers {
            compositeRequest.addValue(value, forHTTPHeaderField: key)
        }
        compositeRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        return compositeRequest
    }
}
