//
//  GoogleObject.swift
//  GoogleClient
//
//  Created by Matthew Wyskiel on 5/24/15.
//  Copyright (c) 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public protocol ObjectType: Mappable {

}

public protocol GoogleObject: ObjectType {
    var kind: String { get }
}

public protocol ListType: ObjectType, Sequence {
    associatedtype `Type`: ObjectType
    var items: [Type]! { get }
}

extension ListType {
    public typealias IteratorType = IndexingIterator<[Type]>
    public typealias Iterator = IteratorType
    
    public func generate() -> IteratorType {
        let objects = items as [Type]
        return objects.makeIterator()
    }

    public subscript(position: Int) -> Type {
        return items[position]
    }
}
public protocol GoogleObjectList: GoogleObject, ListType {

}

class RFC3339Transform: TransformType {

    func transformFromJSON(_ value: AnyObject?) -> Date? {

        guard value != nil else { return nil }

        // Create date formatter
        //        NSDateFormatter *dateFormatter = nil;
        //        if (!dateFormatter) {
        let en_US_POSIX = Locale(localeIdentifier: "en_US_POSIX")
        let dateFormatter = DateFormatter()
        dateFormatter.locale = en_US_POSIX
        dateFormatter.timeZone = TimeZone(forSecondsFromGMT: 0)
        //        }

        // Process
        var date: Date?

        var RFC3339String = String(value as! String).uppercased()
        RFC3339String = RFC3339String.replacingOccurrences(of: "Z", with: "-0000")

        // Remove colon in timezone as iOS 4+ NSDateFormatter breaks. See https://devforums.apple.com/thread/45837
        if RFC3339String.characters.count > 20 {
            let nsRange = NSMakeRange(20, RFC3339String.characters.count - 20)
            // Bridge String to NSString
            let RFC3339StringAsNSString: NSString = RFC3339String
            RFC3339String = RFC3339StringAsNSString.replacingOccurrences(of: ":", with: "", options: [], range: nsRange)

        }

        if date == nil { // 1996-12-19T16:39:57-0800
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
            date = dateFormatter.date(from: RFC3339String)
        }
        if date == nil { // 1937-01-01T12:00:27.87+0020
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSSZZZ"
            date = dateFormatter.date(from: RFC3339String)
        }
        if date == nil { // 1937-01-01T12:00:27
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss"
            date = dateFormatter.date(from: RFC3339String)
        }

        if date == nil {
            NSLog("Could not parse RFC3339 date: \"\(value)\" Possibly invalid format.")
        }

        return date;
    }

    func transformToJSON(_ value: Date?) -> String? {
        guard value != nil else { return nil }
        let en_US_POSIX = Locale(localeIdentifier: "en_US_POSIX")
        let dateFormatter = DateFormatter()
        dateFormatter.locale = en_US_POSIX
        dateFormatter.timeZone = TimeZone(forSecondsFromGMT: 0)

        var string: String?
        if string == nil { // 1996-12-19T16:39:57-0800
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
            string = dateFormatter.string(from: value!)
        }
        if string == nil { // 1937-01-01T12:00:27.87+0020
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSSZZZ"
            string = dateFormatter.string(from: value!)
        }
        if string == nil { // 1937-01-01T12:00:27
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss"
            string = dateFormatter.string(from: value!)
        }

        if string == nil {
            NSLog("Could not parse RFC3339 date: \"\(value)\" Possibly invalid format.")
        }

        return string;
    }
}
