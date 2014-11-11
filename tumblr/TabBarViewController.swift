//
//  TabBarViewController.swift
//  tumblr
//
//  Created by diane cronenwett on 11/8/14.
//  Copyright (c) 2014 dianesorg. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    var selectedButton: UIButton!

    @IBOutlet weak var homeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        homeViewController.view.frame = containerView.frame
        selectedButton = homeButton
        
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        searchViewController.view.frame = containerView.frame
        
//        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as UIViewController
//        composeViewController.view.frame = containerView.frame

        
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        accountViewController.view.frame = containerView.frame

        
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        trendingViewController.view.frame = containerView.frame

        

    }

    @IBAction func homeButton(sender: UIButton) {
        //shows the dynamic view in the container by adding a subview
        selectView(homeViewController, sender: sender)
    }

    @IBAction func searchButton(sender: UIButton) {
        //shows the dynamic view in the container by adding a subview
        selectView(searchViewController, sender: sender)
    }
    
//    @IBAction func composeButton(sender: UIButton) {
//        //shows the dynamic view in the container by adding a subview
//        selectView(composeViewController, sender: sender)
   // }

    @IBAction func accountButton(sender: UIButton) {
        //shows the dynamic view in the container by adding a subview
        selectView(accountViewController, sender: sender)
    }
    
    @IBAction func trendingButton(sender: UIButton) {
        //shows the dynamic view in the container by adding a subview
        selectView(trendingViewController, sender: sender)
    }

    func selectView(viewController: UIViewController, sender: UIButton) {
        selectedButton.selected = false
        selectedButton = sender
        selectedButton.selected = true
        containerView.addSubview(viewController.view)
    }
}
