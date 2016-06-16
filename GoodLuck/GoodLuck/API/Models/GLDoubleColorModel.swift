//
//  GLDoubleColorModel.swift
//  GoodLuck
//
//  Created by BJ.y on 16/5/18.
//  Copyright © 2016年 BJ.y. All rights reserved.
//

import RealmSwift


class GLDoubleColorModel: Object {
    dynamic var r1: Int = 0
    dynamic var r2: Int = 0
    dynamic var r3: Int = 0
    dynamic var r4: Int = 0
    dynamic var r5: Int = 0
    dynamic var r6: Int = 0
    dynamic var g7: Int = 0
    dynamic var key_Id: String = ""
    dynamic var week: String = ""
    dynamic var kDate: NSTimeInterval = 0

    override static func primaryKey() -> String? {
        return "key_Id"
    }
    
    override static func indexedProperties() -> [String] {
        return ["key_Id",]
    }
    
    func toArray() -> Array<Int> {
        return [r1, r2, r3, r4, r5, r6, g7]
    }
}
