//
//  RandomManager.swift
//  GoodLuck
//
//  Created by BJ.y on 16/6/16.
//  Copyright © 2016年 BJ.y. All rights reserved.
//

import UIKit
import SwiftRandom

class RandomManager: NSObject {
    static func randomBall() -> [Int] {
        var balls:[Int] = []
        while balls.count < 6 {
            let ball = Int.random(1, 32)
            if !balls.contains(ball) {
                balls.append(ball)
            }
        }
        balls = balls.sort()
        balls.append(Int.random(1, 16))
        print(balls)
        return balls
    }
}
