//
//  RoundBallCell.swift
//  GoodLuck
//
//  Created by BJ.y on 16/5/21.
//  Copyright © 2016年 BJ.y. All rights reserved.
//

import UIKit

class RoundBallCell: UITableViewCell {
    
    //var model:GLDoubleColorModel
    @IBOutlet weak var ballView: RoundBallView!
    
    private var isAddObserver:Bool = false
    private var kVocontext = 0
    private var model:GLDoubleColorModel = GLDoubleColorModel()
   
    
    
    func setCellData(ballModel:GLDoubleColorModel) -> Void {
        model = ballModel
        _removeObserver()
        _addObjserver()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //self.model = Nil;
        self.isAddObserver = false
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        _removeObserver()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        guard context == &kVocontext else {
            return super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
        }
        
        if keyPath == "r1" {
            ballView.setButtonTitle(String(change?[NSKeyValueChangeNewKey] as! Int), buttonIndex: 0)
        }
        
        if keyPath == "r2" {
            ballView.setButtonTitle(String(change?[NSKeyValueChangeNewKey] as! Int), buttonIndex: 1)
        }
        
        if keyPath == "r3" {
            ballView.setButtonTitle(String(change?[NSKeyValueChangeNewKey] as! Int), buttonIndex: 2)
        }
        
        if keyPath == "r4" {
            ballView.setButtonTitle(String(change?[NSKeyValueChangeNewKey] as! Int), buttonIndex: 3)
        }
        
        if keyPath == "r5" {
            ballView.setButtonTitle(String(change?[NSKeyValueChangeNewKey] as! Int), buttonIndex: 4)
        }
        
        if keyPath == "r6" {
            ballView.setButtonTitle(String(change?[NSKeyValueChangeNewKey] as! Int), buttonIndex: 5)
        }
        
        if keyPath == "g7" {
            ballView.setButtonTitle(String(change?[NSKeyValueChangeNewKey] as! Int), buttonIndex: 6)
        }
    }
    
    private func _addObjserver() {
        _removeObserver()
        self.model.addObserver(self, forKeyPath: "r1",options: [.New],context: &kVocontext)
        self.model.addObserver(self, forKeyPath: "r2", options: [.New], context: &kVocontext);
        self.model.addObserver(self, forKeyPath: "r3",options: [.New],context: &kVocontext)
        self.model.addObserver(self, forKeyPath: "r4", options: [.New], context: &kVocontext);
        self.model.addObserver(self, forKeyPath: "r5",options: [.New],context: &kVocontext)
        self.model.addObserver(self, forKeyPath: "r6", options: [.New], context: &kVocontext);
        self.model.addObserver(self, forKeyPath: "g7",options: [.New],context: &kVocontext)
        self.isAddObserver = true
    }
    
    private func _removeObserver() {
        if self.isAddObserver {
            self.model.removeObserver(self, forKeyPath: "r1")
            self.model.removeObserver(self, forKeyPath: "r2")
            self.model.removeObserver(self, forKeyPath: "r3")
            self.model.removeObserver(self, forKeyPath: "r4")
            self.model.removeObserver(self, forKeyPath: "r5")
            self.model.removeObserver(self, forKeyPath: "r6")
            self.model.removeObserver(self, forKeyPath: "g7")
            self.isAddObserver = false
        }
    }
    
    
    
    deinit {
        if self.isAddObserver {
            _removeObserver()
        }
    }
    
}
