//
//  DBManager.swift
//  GoodLuck
//
//  Created by BJ.y on 16/5/18.
//  Copyright © 2016年 BJ.y. All rights reserved.
//

import UIKit
import RealmSwift
import SwiftFilePath
import Async


let DB_PATH = Path.documentsDir.asString.stringByAppendingString("/DataBase/data.realm")
let DB_DIR = Path.documentsDir.asString.stringByAppendingString("/DataBase")

class DBManager: NSObject {
    static let dbManager = DBManager()
    //private let dbPath:String = Path.
    
    
    private override init() {
        if !Path(DB_DIR).exists {
             try! NSFileManager.defaultManager().createDirectoryAtPath(DB_DIR, withIntermediateDirectories: false, attributes: nil)
        }
        print(DB_PATH)
    }
    
    func updateModel(model:Object ) -> Void {
        let realm = try! Realm(fileURL: NSURL(fileURLWithPath: DB_PATH))
        try! realm.write({
            realm.add(model, update: true)
        })
    }
    
    func updateModels(models:Array<Object> ) -> Void {
        let realm = try! Realm(fileURL: NSURL(fileURLWithPath: DB_PATH))
        try! realm.write({
            realm.add(models, update: true)
        })
    }
    
    
    func topModels(limitCount:Int) -> Results<GLDoubleColorModel> {
        let realm = try! Realm(fileURL: NSURL(fileURLWithPath: DB_PATH))
        let items = realm.objects(GLDoubleColorModel)
        return items
    }
    
}
