//
//  GoogleObject.swift
//  GoogleClient
//
//  Created by Matthew Wyskiel on 5/24/15.
//  Copyright (c) 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public protocol GoogleObject: Mappable {
    var kind: String { get }
}

public protocol GoogleObjectList: GoogleObject, ArrayLiteralConvertible, SequenceType {
    typealias Type: GoogleObject
    var items: [Type]! { get }
}

class RFC3339Transform: TransformType {

    func transformFromJSON(value: AnyObject?) -> NSDate? {
        // Create date formatter
        //        NSDateFormatter *dateFormatter = nil;
        //        if (!dateFormatter) {
        let en_US_POSIX = NSLocale(localeIdentifier: "en_US_POSIX")
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = en_US_POSIX
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        //        }

        // Process
        var date: NSDate?

        var RFC3339String = String(value as! String).uppercaseString
        RFC3339String = RFC3339String.stringByReplacingOccurrencesOfString("Z", withString: "-0000")

        // Remove colon in timezone as iOS 4+ NSDateFormatter breaks. See https://devforums.apple.com/thread/45837
        if count(RFC3339String) > 20 {
            let nsRange = NSMakeRange(20, count(RFC3339String) - 20)
            // Bridge String to NSString
            let RFC3339StringAsNSString: NSString = RFC3339String
            RFC3339String = RFC3339StringAsNSString.stringByReplacingOccurrencesOfString(":", withString: "", options: nil, range: nsRange)

        }

        if date == nil { // 1996-12-19T16:39:57-0800
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
            date = dateFormatter.dateFromString(RFC3339String)
        }
        if date == nil { // 1937-01-01T12:00:27.87+0020
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSSZZZ"
            date = dateFormatter.dateFromString(RFC3339String)
        }
        if date == nil { // 1937-01-01T12:00:27
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss"
            date = dateFormatter.dateFromString(RFC3339String)
        }

        if date == nil {
            NSLog("Could not parse RFC3339 date: \"\(value)\" Possibly invalid format.")
        }

        return date;
    }

    func transformToJSON(value: NSDate?) -> String? {
        let en_US_POSIX = NSLocale(localeIdentifier: "en_US_POSIX")
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = en_US_POSIX
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)

        var string: String?
        if string == nil { // 1996-12-19T16:39:57-0800
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
            string = dateFormatter.stringFromDate(value!)
        }
        if string == nil { // 1937-01-01T12:00:27.87+0020
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSSZZZ"
            string = dateFormatter.stringFromDate(value!)
        }
        if string == nil { // 1937-01-01T12:00:27
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss"
            string = dateFormatter.stringFromDate(value!)
        }

        if string == nil {
            NSLog("Could not parse RFC3339 date: \"\(value)\" Possibly invalid format.")
        }

        return string;
    }
}

extension Bool {
    func toJSONAndQueryString() -> String {
        if boolValue {
            return "true"
        } else {
            return "false"
        }
    }
}
