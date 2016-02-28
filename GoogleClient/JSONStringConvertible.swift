//
//  JSONStringConvertible.swift
//  GoogleClient
//
//  Created by Matthew Wyskiel on 12/6/15.
//  Copyright © 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation

protocol JSONStringConvertible {
    func toJSONString() -> String
}

extension Bool: JSONStringConvertible {
    func toJSONString() -> String {
        if boolValue {
            return "true"
        } else {
            return "false"
        }
    }
}

extension Int: JSONStringConvertible {
    func toJSONString() -> String {
        return "\(self)"
    }
}

extension UInt: JSONStringConvertible {
    func toJSONString() -> String {
        return "\(self)"
    }
}

extension NSDate: JSONStringConvertible {
    func toJSONString() -> String {
        if let dateString = RFC3339Transform().transformToJSON(self) {
            return dateString
        } else {
            return ""
        }
    }
}

extension UInt64: JSONStringConvertible {
    func toJSONString() -> String {
        return "\(self)"
    }
}