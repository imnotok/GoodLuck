//
//  AnalysisManager.swift
//  GoodLuck
//
//  Created by BJ.y on 16/5/18.
//  Copyright © 2016年 BJ.y. All rights reserved.
//

import UIKit

class AnalysisManager: NSObject {
    class var sharedInstance : AnalysisManager {
        struct Static {
            static let instance : AnalysisManager = AnalysisManager()
        }
        return Static.instance
    }
}
