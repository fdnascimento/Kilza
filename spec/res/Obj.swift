//
//  Obj.m
//
//  Created on <%= Time.now.strftime("%Y-%m-%d") %>
//  Copyright (c) <%= Time.now.strftime("%Y") %>. All rights reserved.
//

import Foundation

public class Obj: NSObject, NSCoding {
    // Original names
    internal let kObjStr: String = "str"
    internal let kObjNum: String = "num"
    internal let kObjFlo: String = "flo"
    internal let kObjBoo: String = "boo"

    public var str: String?
    public var num: Int?
    public var flo: Double?
    public var boo: Bool?

    public class func model(obj: AnyObject) -> Obj {
        var instance: Obj?
        if (obj is String) {
            instance = Obj.init(str: obj as! String)
        } else if (obj is Dictionary<String, AnyObject>) {
            instance = Obj.init(dict: obj as! Dictionary)
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
        self.str = objectOrNil(forKey: kObjStr, fromDictionary:dict) as? String
        self.num = objectOrNil(forKey: kObjNum, fromDictionary:dict) as? Int
        self.flo = objectOrNil(forKey: kObjFlo, fromDictionary:dict) as? Double
        self.boo = objectOrNil(forKey: kObjBoo, fromDictionary:dict) as? Bool
    }

    public func dictionaryRepresentation() -> Dictionary<String, AnyObject> {
        var mutableDict: Dictionary = [String: AnyObject]()
        mutableDict[kObjStr] = self.str
        mutableDict[kObjNum] = self.num
        mutableDict[kObjFlo] = self.flo
        mutableDict[kObjBoo] = self.boo
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
        self.str = aDecoder.decodeObjectForKey(kObjStr)! as? String
        self.num = aDecoder.decodeObjectForKey(kObjNum)! as? Int
        self.flo = aDecoder.decodeObjectForKey(kObjFlo)! as? Double
        self.boo = aDecoder.decodeObjectForKey(kObjBoo)! as? Bool
    }

    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(str, forKey:kObjStr)
        aCoder.encodeObject(num, forKey:kObjNum)
        aCoder.encodeObject(flo, forKey:kObjFlo)
        aCoder.encodeObject(boo, forKey:kObjBoo)
    }

    override public var description: String {
        get {
            return "\(dictionaryRepresentation())"
        }
    }
}
