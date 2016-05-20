//
//  DataUpdateManager.swift
//  GoodLuck
//
//  Created by BJ.y on 16/5/18.
//  Copyright © 2016年 BJ.y. All rights reserved.
//

import UIKit
import Alamofire
import Fuzi
import Async

class DataUpdateManager: NSObject {
    
    static func updateData() -> Void {
        Alamofire.request(.GET, "http://www.17500.cn/ssq/awardlist.php?p=1").responseString { (response) in
            if (response.response?.statusCode == 200 && response.result.error == nil) {
                Async.background(block: {
                    let list = self.praseHtmlToModes(response.result.value!)
                    DBManager.dbManager.updateModels(list)
                }).main(chainingBlock: {
                    print("update success")
                })
            }
            else {
                print(response.result.error?.localizedDescription)
            }
        }
    }
    
    
    static func praseHtmlToModes(html:String) -> Array<GLDoubleColorModel> {
        var dataList = Array<GLDoubleColorModel>()
        do {
            let enc = CFStringConvertEncodingToNSStringEncoding(UInt32(CFStringEncodings.GB_18030_2000.rawValue))
            let doc = try HTMLDocument(string: html, encoding: enc)
            let tBody = doc.firstChild(xpath: "//tbody")
            if  tBody != nil {
                let trNodes = tBody!.children
                for trNode in trNodes {
                    let dbModel:GLDoubleColorModel = GLDoubleColorModel()
                    let tdNodes = trNode.children
                    var i = 0
                    
                    for tdNode in tdNodes {
                        let tempValue = tdNode.stringValue
                        if i == 0 {
                            dbModel.key_Id = tempValue
                        }
                        else if i == 1 {
                            dbModel.kDate = Utilities.dateFromString(tempValue, formatString:"yyyy-MM-dd")!.timeIntervalSince1970
                            
                        }
                        else if  i == 2 {
                            dbModel.week = tempValue
                        }
                        else if  i == 3 {
                            var nums = praseDoubleColorString(tempValue);
                            dbModel.r1 = nums[0];
                            dbModel.r2 = nums[1];
                            dbModel.r3 = nums[2];
                            dbModel.r4 = nums[3];
                            dbModel.r5 = nums[4];
                            dbModel.r6 = nums[5];
                            dbModel.g7 = nums[6];
                        }
                        else {
                            break;
                        }
                        i = i + 1;
                    }
                    if !dbModel.key_Id.isEmpty {
                        dataList.append(dbModel)
                    }
                }
            }
        } catch let error {
            print(error)
        }
        return dataList
    }
    
    
    static func praseDoubleColorString(dcString:String) ->[Int] {
        let redStrings:[String] = dcString.split(" ")
        var numbers:[Int] = [0, 0, 0, 0, 0, 0, 0]
        for index in 0 ... 4 {
            numbers[index] = Int(redStrings[index])!;
        }
        let blueStrings:[String] = (redStrings.last?.split("+"))!
        numbers[5] = Int(blueStrings[0])!
        numbers[6] = Int(blueStrings[1])!
        return numbers
    }
}
