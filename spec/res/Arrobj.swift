//
//  Arrobj.m
//
//  Created on <%= Time.now.strftime("%Y-%m-%d") %>
//  Copyright (c) <%= Time.now.strftime("%Y") %>. All rights reserved.
//

import Foundation

public class Arrobj: NSObject, NSCoding {
    // Original names
    internal let kArrobjStr: String = "str"
    internal let kArrobjNum: String = "num"
    internal let kArrobjFlo: String = "flo"
    internal let kArrobjBoo: String = "boo"
    internal let kArrobjNull: String = "null"

    public var str: String?
    public var num: Int?
    public var flo: Double?
    public var boo: Bool?
    public var null: AnyObject?

    public class func model(obj: AnyObject) -> Arrobj {
        var instance: Arrobj?
        if (obj is String) {
            instance = Arrobj.init(str: obj as! String)
        } else if (obj is Dictionary<String, AnyObject>) {
            instance = Arrobj.init(dict: obj as! Dictionary)
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
        self.str = objectOrNil(forKey: kArrobjStr, fromDictionary:dict) as? String
        self.num = objectOrNil(forKey: kArrobjNum, fromDictionary:dict) as? Int
        self.flo = objectOrNil(forKey: kArrobjFlo, fromDictionary:dict) as? Double
        self.boo = objectOrNil(forKey: kArrobjBoo, fromDictionary:dict) as? Bool
        self.null = Null.model(dict[kArrobjNull]!)
    }

    public func dictionaryRepresentation() -> Dictionary<String, AnyObject> {
        var mutableDict: Dictionary = [String: AnyObject]()
        mutableDict[kArrobjStr] = self.str
        mutableDict[kArrobjNum] = self.num
        mutableDict[kArrobjFlo] = self.flo
        mutableDict[kArrobjBoo] = self.boo
        mutableDict[kArrobjNull] = self.null
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
        self.str = aDecoder.decodeObjectForKey(kArrobjStr)! as? String
        self.num = aDecoder.decodeObjectForKey(kArrobjNum)! as? Int
        self.flo = aDecoder.decodeObjectForKey(kArrobjFlo)! as? Double
        self.boo = aDecoder.decodeObjectForKey(kArrobjBoo)! as? Bool
        self.null = aDecoder.decodeObjectForKey(kArrobjNull)!
    }

    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(str, forKey:kArrobjStr)
        aCoder.encodeObject(num, forKey:kArrobjNum)
        aCoder.encodeObject(flo, forKey:kArrobjFlo)
        aCoder.encodeObject(boo, forKey:kArrobjBoo)
        aCoder.encodeObject(null, forKey:kArrobjNull)
    }

    override public var description: String {
        get {
            return "\(dictionaryRepresentation())"
        }
    }
}