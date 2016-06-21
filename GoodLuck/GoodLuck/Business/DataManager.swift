//
//  DataManager.swift
//  GoodLuck
//
//  Created by BJ.y on 16/6/21.
//  Copyright © 2016年 BJ.y. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    static let share = DataManager()
    var balls = [GLDoubleColorModel]()
    
    private override init() {
        super.init()
    }
    
    func resetBalls(ballCount:Int) {
        var resetBalls = [GLDoubleColorModel]()
        for _ in 1...ballCount {
            let ball = GLDoubleColorModel()
            resetBalls.append(ball)
        }
        balls = resetBalls
    }
    
    func randomBall()  {
        let count = balls.count
        for index in 0...count - 1 {
            let ball = RandomManager.randomBall()
            let ballModel = balls[index]
            ballModel.setValue(ball)
            
        }
    }
    
    

}
