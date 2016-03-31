//
//  UploadParameters.swift
//  GoogleClient
//
//  Created by Matthew Wyskiel on 3/31/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation

public struct UploadParameters {
    public var progressHandler: ((bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) -> ())? = nil
    public var MIMEType: String
    public var data: NSData
    
    public init(data: NSData, MIMEType: String) {
        self.data = data
        self.MIMEType = MIMEType
    }
}