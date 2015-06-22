//
//  ToJSON.swift
//  ObjectMapper
//
//  Created by Tristan Himmelman on 2014-10-13.
//  Copyright (c) 2014 hearst. All rights reserved.
//

import class Foundation.NSNumber

private func setValue(value: AnyObject, forKey key: String, inout dictionary: [String : AnyObject]) {
	let keyComponents = ArraySlice(split(key.characters) { $0 == "." })
	return setValue(value, forKeyPathComponents: keyComponents, dictionary: &dictionary)
}

private func setValue(value: AnyObject, forKeyPathComponents components: ArraySlice<String.CharacterView.SubSlice>, inout dictionary: [String : AnyObject]) {
	if components.isEmpty {
		return
	}

	let head = components.first!

	if components.count == 1 {
		return dictionary[String(head)] = value
	} else {
		var child = dictionary[String(head)] as? [String : AnyObject]
		if child == nil {
			child = [:]
		}

		let tail = dropFirst(components)
		setValue(value, forKeyPathComponents: tail, dictionary: &child!)

		return dictionary[String(head)] = child
	}
}

internal final class ToJSON {
	
	class func basicType<N>(field: N, key: String, inout dictionary: [String : AnyObject]) {
		func _setValue(value: AnyObject) {
			setValue(value, forKey: key, dictionary: &dictionary)
		}

		switch field {
		// basic Types
		case let x as NSNumber:
			_setValue(x)
		case let x as Bool:
			_setValue(x)
		case let x as Int:
			_setValue(x)
		case let x as Double:
			_setValue(x)
		case let x as Float:
			_setValue(x)
		case let x as String:
			_setValue(x)

		// Arrays with basic types
		case let x as Array<NSNumber>:
			_setValue(x)
		case let x as Array<Bool>:
			_setValue(x)
		case let x as Array<Int>:
			_setValue(x)
		case let x as Array<Double>:
			_setValue(x)
		case let x as Array<Float>:
			_setValue(x)
		case let x as Array<String>:
			_setValue(x)
		case let x as Array<AnyObject>:
			_setValue(x)

		// Dictionaries with basic types
		case let x as Dictionary<String, NSNumber>:
			_setValue(x)
		case let x as Dictionary<String, Bool>:
			_setValue(x)
		case let x as Dictionary<String, Int>:
			_setValue(x)
		case let x as Dictionary<String, Double>:
			_setValue(x)
		case let x as Dictionary<String, Float>:
			_setValue(x)
		case let x as Dictionary<String, String>:
			_setValue(x)
		case let x as Dictionary<String, AnyObject>:
			_setValue(x)
		default:
			//print("Default")
			return
		}
	}

    class func optionalBasicType<N>(field: N?, key: String, inout dictionary: [String : AnyObject]) {
        if let field = field {
            basicType(field, key: key, dictionary: &dictionary)
        }
    }

	class func object<N: Mappable>(field: N, key: String, inout dictionary: [String : AnyObject]) {
		setValue(Mapper().toJSON(field), forKey: key, dictionary: &dictionary)
	}

    class func optionalObject<N: Mappable>(field: N?, key: String, inout dictionary: [String : AnyObject]) {
        if let field = field {
            object(field, key: key, dictionary: &dictionary)
        }
    }
    
	class func objectArray<N: Mappable>(field: Array<N>, key: String, inout dictionary: [String : AnyObject]) {
		let JSONObjects = Mapper().toJSONArray(field)

		setValue(JSONObjects, forKey: key, dictionary: &dictionary)
	}

    class func optionalObjectArray<N: Mappable>(field: Array<N>?, key: String, inout dictionary: [String : AnyObject]) {
        if let field = field {
            objectArray(field, key: key, dictionary: &dictionary)
        }
    }
    
	class func objectDictionary<N: Mappable>(field: Dictionary<String, N>, key: String, inout dictionary: [String : AnyObject]) {
		let JSONObjects = Mapper().toJSONDictionary(field)

		setValue(JSONObjects, forKey: key, dictionary: &dictionary)
	}

    class func optionalObjectDictionary<N: Mappable>(field: Dictionary<String, N>?, key: String, inout dictionary: [String : AnyObject]) {
        if let field = field {
            objectDictionary(field, key: key, dictionary: &dictionary)
        }
    }
	
	class func objectDictionaryOfArrays<N: Mappable>(field: Dictionary<String, [N]>, key: String, inout dictionary: [String : AnyObject]) {
		let JSONObjects = Mapper().toJSONDictionaryOfArrays(field)

		setValue(JSONObjects, forKey: key, dictionary: &dictionary)
	}
	
	class func optionalObjectDictionaryOfArrays<N: Mappable>(field: Dictionary<String, [N]>?, key: String, inout dictionary: [String : AnyObject]) {
		if let field = field {
			objectDictionaryOfArrays(field, key: key, dictionary: &dictionary)
		}
	}
}
