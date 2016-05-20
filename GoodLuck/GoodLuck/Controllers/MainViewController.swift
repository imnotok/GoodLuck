//
//  ViewController.swift
//  GoodLuck
//
//  Created by BJ.y on 16/5/16.
//  Copyright © 2016年 BJ.y. All rights reserved.
//

import UIKit
import MotionAnimation


class MainViewController: UIViewController {

    var transition = ElasticTransition()
    let lgr = UIScreenEdgePanGestureRecognizer()
    let rgr = UIScreenEdgePanGestureRecognizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // customization
        transition.sticky = true
        transition.showShadow = false
        transition.panThreshold = 0.2
        transition.transformType = .TranslateMid
//        
//            transition.overlayColor = UIColor(white: 0, alpha: 0.5)
//            transition.shadowColor = UIColor(white: 0, alpha: 0.5)
        
        // gesture recognizer
        lgr.addTarget(self, action: #selector(MainViewController.handlePan(_:)))
        rgr.addTarget(self, action: #selector(MainViewController.handleRightPan(_:)))
        lgr.edges = .Left
        rgr.edges = .Right
        view.addGestureRecognizer(lgr)
        view.addGestureRecognizer(rgr)
    }
    
    func handlePan(pan:UIPanGestureRecognizer){
        if pan.state == .Began{
            transition.edge = .Left
            transition.startInteractiveTransition(self, segueIdentifier: "toMenuViewController", gestureRecognizer: pan)
        }else{
            transition.updateInteractiveTransition(gestureRecognizer: pan)
        }
    }
    
    func handleRightPan(pan:UIPanGestureRecognizer){
        if pan.state == .Began{
            transition.edge = .Right
            transition.startInteractiveTransition(self, segueIdentifier: "about", gestureRecognizer: pan)
        }else{
            transition.updateInteractiveTransition(gestureRecognizer: pan)
        }
    }
    
    @IBAction func leftBtnTouched(sender: AnyObject) {
        transition.edge = .Left
        transition.startingPoint = sender.center
        performSegueWithIdentifier("toMenuViewController", sender: self)
    }
    
    @IBAction func bottomBtnTouched(sender: AnyObject) {
        transition.edge = .Bottom
        transition.startingPoint = sender.center
        performSegueWithIdentifier("toBottomSettingViewController", sender: self)
    }
    
    @IBAction func aboutBtnTouched(sender: AnyObject) {
        transition.edge = .Right
        transition.startingPoint = sender.center
        performSegueWithIdentifier("about", sender: self)
    }
    
    @IBAction func modalBtnTouched(sender: AnyObject) {
        let modalViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MenuViewController") as! MenuViewController
        presentViewController(modalViewController, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController
        vc.transitioningDelegate = transition
        vc.modalPresentationStyle = .Custom
    }


}

