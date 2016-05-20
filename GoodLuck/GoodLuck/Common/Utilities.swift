//
//  Utilities.swift
//  GoodLuck
//
//  Created by BJ.y on 16/5/19.
//  Copyright © 2016年 BJ.y. All rights reserved.
//

import UIKit

class Utilities: NSObject {
    static func dateFromString(dateString: String, formatString:String) -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = formatString
        let date = dateFormatter.dateFromString(dateString)
        return date
    }
}


public extension NSDate {
}



extension String{
    
    func split(s:String)->[String]{
        
        if s.isEmpty{
            
            var spiltedString=[String]()
            
            for y in self.characters{
                
                spiltedString.append(String(y))
                
            }
            return spiltedString
            
        }
        return self.componentsSeparatedByString(s)
        
    }
}
