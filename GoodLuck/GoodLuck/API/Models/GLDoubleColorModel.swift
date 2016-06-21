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
    
    func setValue(balls:[Int]) -> Void {
        var ballNew = Array.init(count: 7, repeatedValue: 0)
        
        for index in 0...balls.count - 1 {
            ballNew[index] = balls[index]
        }
        
        r1 = ballNew[0]
        r2 = ballNew[1]
        r3 = ballNew[2]
        r4 = ballNew[3]
        r5 = ballNew[4]
        r6 = ballNew[5]
        g7 = ballNew[6]
    }
}
