//
//  TrendingViewController.swift
//  tumblr
//
//  Created by diane cronenwett on 11/8/14.
//  Copyright (c) 2014 dianesorg. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var trendFeed: UIImageView!
    @IBOutlet weak var trendScrollFeed: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        var containerHeight = trendFeed.frame.height
      
        trendScrollFeed.delegate = self
        trendScrollFeed.contentSize.height = containerHeight
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
