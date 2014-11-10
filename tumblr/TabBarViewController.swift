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

    override func viewDidLoad() {
        super.viewDidLoad()
  
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
      homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        homeViewController.view.frame = containerView.frame
        
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        searchViewController.view.frame = containerView.frame
        
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as UIViewController
        composeViewController.view.frame = containerView.frame

        
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        accountViewController.view.frame = containerView.frame

        
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        trendingViewController.view.frame = containerView.frame


    }

    @IBAction func homeButton(sender: AnyObject) {
        //shows the dynamic view in the container by adding a subview

         containerView.addSubview(homeViewController.view)
    }

    
    @IBAction func searchButton(sender: AnyObject) {
        //shows the dynamic view in the container by adding a subview
        
        containerView.addSubview(searchViewController.view)
    }
    @IBAction func composeButton(sender: AnyObject) {
        //shows the dynamic view in the container by adding a subview
        
        containerView.addSubview(composeViewController.view)
    }

    @IBAction func accountButton(sender: AnyObject) {
        //shows the dynamic view in the container by adding a subview
        
        containerView.addSubview(accountViewController.view)
    }
    @IBAction func trendingButton(sender: AnyObject) {
        //shows the dynamic view in the container by adding a subview
        
        containerView.addSubview(trendingViewController.view)
    }

    
}
