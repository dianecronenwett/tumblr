//
//  TabBarViewController.swift
//  tumblr
//
//  Created by diane cronenwett on 11/8/14.
//  Copyright (c) 2014 dianesorg. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController,UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning  {
    
    var isPresenting: Bool = true

    @IBOutlet weak var containerView: UIView!
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    var selectedButton: UIButton!   // Keep track of what button is selected
    var currentViewController: UIViewController!

    @IBOutlet weak var homeButton: UIButton!
    
    @IBOutlet weak var explorePopup: UIImageView!
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        homeViewController.view.frame = containerView.frame
        

        selectedButton = homeButton
        currentViewController = homeViewController
        
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        searchViewController.view.frame = containerView.frame
        
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat, animations: { () -> Void in
            self.explorePopup.frame.offset(dx: 0, dy: -60)
        }, completion: nil)
       
        
//        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as UIViewController
//        composeViewController.view.frame = containerView.frame

        
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        accountViewController.view.frame = containerView.frame
       
        
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        trendingViewController.view.frame = containerView.frame

        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
    isPresenting = true
    return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
             
            //add statement around "as viewController"
//            var originalY = self.textButton.frame.origin.y
//                    self.textButton.frame.origin.y = 600
//                    UIView.animateWithDuration(1, delay: 1, options: .CurveEaseOut, animations: {
//                        self.textButton.frame.origin.y = originalY
//                        }, completion: { finished in
//                            
                    
                  //  })

                    
            }
            
            
        } else {
            println("dismissing")
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }

    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }       
 
    

    @IBAction func homeButton(sender: UIButton) {
        //shows the dynamic view in the container by adding a subview
        selectView(homeViewController, sender: sender)
        explorePopup.hidden = false
    }

    @IBAction func searchButton(sender: UIButton) {
        //shows the dynamic view in the container by adding a subview
        selectView(searchViewController, sender: sender)
        explorePopup.hidden = true
    }
    

    

    
//    @IBAction func composeButton(sender: UIButton) {
//        //shows the dynamic view in the container by adding a subview
//        selectView(composeViewController, sender: sender)
   // }

    @IBAction func accountButton(sender: UIButton) {
        //shows the dynamic view in the container by adding a subview
        selectView(accountViewController, sender: sender)
        explorePopup.hidden = false
    }
    
    @IBAction func trendingButton(sender: UIButton) {
        //shows the dynamic view in the container by adding a subview
        selectView(trendingViewController, sender: sender)
        explorePopup.hidden = false
    }

    func selectView(newViewController: UIViewController, sender: UIButton) {
        selectedButton.selected = false
        selectedButton = sender
        selectedButton.selected = true
        
        currentViewController.view.removeFromSuperview()
        containerView.addSubview(newViewController.view)
        
        currentViewController.removeFromParentViewController()
        self.addChildViewController(newViewController)
        
        currentViewController = newViewController
    }
}
