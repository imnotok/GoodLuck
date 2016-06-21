//
//  ViewController.swift
//  GoodLuck
//
//  Created by BJ.y on 16/5/16.
//  Copyright © 2016年 BJ.y. All rights reserved.
//

import UIKit
import MotionAnimation


class MainViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    //View
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topContainerView: UIView!
    @IBOutlet weak var midContainerView: UIView!
    @IBOutlet weak var bottomContainerView: UIView!
    @IBOutlet weak var issueLabel: UILabel!
    
    var transition = ElasticTransition()
    let lgr = UIScreenEdgePanGestureRecognizer()
    let rgr = UIScreenEdgePanGestureRecognizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configViews()
        self.configTableView()
        // customization
        transition.sticky = true
        transition.showShadow = false
        transition.panThreshold = 0.2
        transition.transformType = .TranslateMid
        //
        //            transition.overlayColor = UIColor(white: 0, alpha: 0.5)
        //            transition.shadowColor = UIColor(white: 0, alpha: 0.5)
        
        // gesture recognizer236,240,241
        
        lgr.addTarget(self, action: #selector(MainViewController.handlePan(_:)))
        rgr.addTarget(self, action: #selector(MainViewController.handleRightPan(_:)))
        lgr.edges = .Left
        rgr.edges = .Right
        view.addGestureRecognizer(lgr)
        view.addGestureRecognizer(rgr)
        //DataUpdateManager.updateData()
        // AnalysisManager.sharedInstance.testKill()
        createBallData(3)
    }
    
    // MARK: - Config view and Data
    // MARK:  Config view
    func configViews()  {
        self.topContainerView.layer.cornerRadius = 6
        self.midContainerView.layer.cornerRadius = 6
        self.bottomContainerView.layer.cornerRadius = 6
        self.view.backgroundColor = GLAppConfig.GLColorForRed
        
    }
    
    func configTableView() {
        let nib = UINib.init(nibName: "RoundBallCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "identyRoundBallCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.editing = true
        
        //self.tableView.allowsMultipleSelection = true
    }
    
    // MARK:  Config Data
    
    func createBallData(ballCount:Int) {
        DataManager.share.resetBalls(ballCount)
        tableView.reloadData()
    }
    
    //MARK: - UITableView
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.share.balls.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identy = "identyRoundBallCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identy)  as? RoundBallCell
        let roundCell:RoundBallCell = cell!
        roundCell.setCellData(DataManager.share.balls[indexPath.row])
        return roundCell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    //    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    //        return false
    //    }
    
    func handlePan(pan:UIPanGestureRecognizer){
        if pan.state == .Began{
            transition.edge = .Left
            transition.startInteractiveTransition(self, segueIdentifier: "toMenuViewController", gestureRecognizer: pan)
        }else{
            transition.updateInteractiveTransition(gestureRecognizer: pan)
        }
    }
    
    //    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    //        return true
    //    }
    //    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
    //        return UITableViewCellEditingStyle.Delete
    //    }
    
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
        DataManager.share.randomBall()
        //transition.edge = .Bottom
        //transition.startingPoint = sender.center
        //performSegueWithIdentifier("toBottomSettingViewController", sender: self)
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
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    
}

