//
//  RoundBallView.swift
//  GoodLuck
//
//  Created by BJ.y on 16/5/21.
//  Copyright © 2016年 BJ.y. All rights reserved.
//

import UIKit

let kButtonSpace = 15;

class RoundBallView: UIView {
    let buttons = [RoundButton(roundButtonSytle: RoundButtonStyle.Red), RoundButton(roundButtonSytle: RoundButtonStyle.Red), RoundButton(roundButtonSytle: RoundButtonStyle.Red), RoundButton(roundButtonSytle: RoundButtonStyle.Red), RoundButton(roundButtonSytle: RoundButtonStyle.Red), RoundButton(roundButtonSytle: RoundButtonStyle.Red), RoundButton(roundButtonSytle: RoundButtonStyle.Blue)]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addButtons()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addButtons()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addButtons()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.configSubview()
    }
    
    func addButtons() {
        for button in self.buttons {
            self.addSubview(button)
        }
    }
    
    func configSubview() {
        let rect = self.bounds
        let width = (CGRectGetWidth(rect) - (15.0 * 8)) / 7
        let height = CGRectGetHeight(rect)
        if width > height {
            print("!!!!warning the the height of RoundBallView is too small")
        }
        var x:CGFloat = 15.0
        for index in 0...6 {
            let buttonRect = CGRect(x: x, y: 0.0, width: width, height: width)
            self.buttons[index].frame = buttonRect
            self.buttons[index].center.y = self.center.y
            x = x + width + 15
        }
        
    }
}
