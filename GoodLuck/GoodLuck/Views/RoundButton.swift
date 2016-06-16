//
//  RoundButton.swift
//  GoodLuck
//
//  Created by BJ.y on 16/5/21.
//  Copyright © 2016年 BJ.y. All rights reserved.
//

import UIKit



public enum RoundButtonStyle: Int {
    case None = 0
    case Red = 1
    case Blue = 2
}

class RoundButton: UIButton {
     var roundButtonSytle:RoundButtonStyle = RoundButtonStyle.Red  {
        willSet(newRoundButtonSytle) {
        
        }
        didSet {
            self.setTyle()
        }
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel?.font = UIFont.boldSystemFontOfSize(14)
        self.setTyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.titleLabel?.font = UIFont.boldSystemFontOfSize(14)
        self.setTyle()
    }
    
    
    internal init(roundButtonSytle: RoundButtonStyle) {
        self.roundButtonSytle = roundButtonSytle
        super.init(frame: CGRectZero)
        let title = self.roundButtonSytle == RoundButtonStyle.Red ? "?" : "?"
        self.setTitle(title, forState: UIControlState.Normal)
        self.titleLabel?.font = UIFont.boldSystemFontOfSize(14)
        self.setTyle()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel?.font = UIFont.boldSystemFontOfSize(14)
        self.setTyle()
    }
    
    private func setTyle() -> Void {
        if self.roundButtonSytle != RoundButtonStyle.None {
            if self.roundButtonSytle == RoundButtonStyle.Red {
                self.backgroundColor = GLAppConfig.GLColorForRed
            }
            else {
                self.backgroundColor = GLAppConfig.GLColorForBlue
            }
        }

    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override func layoutSubviews() {
        super.layoutSubviews()
        let rect = self.bounds
        self.layer.cornerRadius = CGRectGetWidth(rect) / 2.0
    }

}
