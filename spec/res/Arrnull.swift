//
//  Arrnull.m
//
//  Created on <%= Time.now.strftime("%Y-%m-%d") %>
//  Copyright (c) <%= Time.now.strftime("%Y") %>. All rights reserved.
//

import Foundation

public class Arrnull: NSObject, NSCoding {
    // Original names


    public class func model(obj: AnyObject) -> Arrnull {
        var instance: Arrnull?
        if (obj is String) {
            instance = Arrnull.init(str: obj as! String)
        } else if (obj is Dictionary<String, AnyObject>) {
            instance = Arrnull.init(dict: obj as! Dictionary)
        }
        return instance!
    }

    public convenience init(str: String) {
        if let data = str.dataUsingEncoding(NSUTF8StringEncoding) {
          do {
              let object: AnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
              self.init(dict: object as! Dictionary)
          } catch _ as NSError {
              self.init(dict: Dictionary())
          }
        } else {
          self.init(dict: Dictionary())
        }
    }

    public init(dict: Dictionary<String, AnyObject>) {
      super.init()
    }

    public func dictionaryRepresentation() -> Dictionary<String, AnyObject> {
        let mutableDict: Dictionary = [String: AnyObject]()
        return NSDictionary.init(dictionary: mutableDict) as! Dictionary<String, AnyObject>
    }

    public func objectOrNil(forKey key: String, fromDictionary dict: Dictionary<String, AnyObject>) -> AnyObject?
    {
      if let object: AnyObject = dict[key] {
        if !(object is NSNull) {
          return object
        }
      }
      return nil
    }

    required public init(coder aDecoder: NSCoder) {
    }

    public func encodeWithCoder(aCoder: NSCoder) {
    }

    override public var description: String {
        get {
            return "\(dictionaryRepresentation())"
        }
    }
}