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
    
    class var redBalls:[Int] {
        return [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32]
    }
    
    func testKill() -> Void {
        let models = DBManager.dbManager.topModels(10)
        for i in 1...models.count - 1{
            var remainBalls:Array<Int>
            let item:GLDoubleColorModel? =  models[i];
            if (item == nil) {
                remainBalls = AnalysisManager.redBalls
            }
            else {
                let model = item!
                let kill1 = self.Kill1(model.toArray())
                let kill2 = self.kill2(model.toArray())
                remainBalls = AnalysisManager.redBalls.filter { (i) -> Bool in
                    !kill1.contains(i) && !kill2.contains(i)
                }
            }
            //print(models[i-1].toArray())
            //print(remainBalls)
            self.killChance(models[i-1].toArray(), predict: remainBalls)
        }
    }
    
    func killChance(result:Array<Int>, predict:Array<Int>) -> Void {
        var isExist = 0
        for i in 0...4 {
            if predict.contains(result[i]) {
                isExist += 1
            }
        }
        let a:Float = Float(isExist) / Float(predict.count)
        
        print("6-" + String(isExist) + ":" + String(a))
    }
    func Analysis() -> Array<Int> {
        var remainBalls:Array<Int>
        let models = DBManager.dbManager.topModels(10)
        let first:GLDoubleColorModel? =  models.first;
        if (first == nil) {
            remainBalls = AnalysisManager.redBalls
        }
        else {
            let firstModel = first!
            let kill1 = self.Kill1(firstModel.toArray())
            let kill2 = self.kill2(firstModel.toArray())
            
            remainBalls = AnalysisManager.redBalls.filter { (i) -> Bool in
                !kill1.contains(i) && !kill2.contains(i)
            }
        }
        
        print(remainBalls)
        return remainBalls
    }
    
    func Kill1(data:Array<Int>) -> Array<Int> {
        var killBalls = Array<Int>()
        
        var kill = 0
        for index in 0...5 {
            if data[index] < 10 {
                kill = kill + data[index]
            }
            else {
                let num1 = data[index] % 10
                let num2 = data[index] / 10
                kill = kill + num1 + num2
            }
        }
        if kill > 33 {
            kill = kill - 33
        }
        
        killBalls.append(kill)
        kill = 54 - data[2]
        killBalls.append(kill)
        
        kill = data[5] - data[0]
        killBalls.append(kill)
        kill = data[5] - data[6]
        killBalls.append(kill)
        
        
        var sum = 0
        
        for item in data {
            sum  = sum + item
        }
        
        let sumString:String = String(sum)
        kill = 0
        for item in sumString.characters {
            kill = kill + Int(String(item))!
        }
        
        killBalls.append(kill)
        
        kill = data[6] * 2
        killBalls.append(kill)
        
        if data[6] % 2 == 0{
            kill = data[6] * 2
            killBalls.append(kill)
        }
        
        kill = data[4] + 5
        killBalls.append(kill)
        kill = 34 - data[0]
        killBalls.append(kill)
        kill = 34 - data[2] + 7
        killBalls.append(kill)
        //print(killBalls)
        return killBalls
    }
    
    //
    func kill2(balls:Array<Int>) -> Array<Int> {
        var kill = 0
        var killBalls = Array<Int>()
        
        kill = balls[5] - balls[0]
        killBalls.append(kill)
        kill = balls[2] - balls[1]
        killBalls.append(kill)
        kill = balls[4] - balls[1]
        killBalls.append(kill)
        kill = balls[0] * 4 - 2
        killBalls.append(kill)
        
        kill = (balls[0] + balls[6]) * 3
        killBalls.append(kill)
        
        kill = balls[0] +  9
        killBalls.append(kill)
        
        kill = balls[1] +  5
        killBalls.append(kill)
        
        kill = balls[2] +  4
        killBalls.append(kill)
        
        kill = balls[2] +  7
        killBalls.append(kill)
        
        kill = balls[5] +  4
        killBalls.append(kill)
        
        kill = balls[4] - balls[3] + balls[6] + 1
        killBalls.append(kill)
        
        kill = balls[0] + balls[1]
        killBalls.append(kill)
        
        kill = balls[2] - balls[1]
        killBalls.append(kill)
        
        kill = balls[4] - balls[2]
        killBalls.append(kill)
        //print(killBalls)
        return killBalls;
    }
}
