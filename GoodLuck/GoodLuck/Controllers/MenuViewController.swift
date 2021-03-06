//
//  MenuViewController.swift
//  GoodLuck
//
//  Created by BJ.y on 16/5/20.
//  Copyright © 2016年 BJ.y. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,ElasticMenuTransitionDelegate {

    var contentLength:CGFloat = 320
    var dismissByBackgroundTouch = true
    var dismissByBackgroundDrag = true
    var dismissByForegroundDrag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didHistoryButtonPressed(sender: AnyObject) {
        let controller = UIViewController()
        presentViewController(controller, animated: true, completion: nil)
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}
