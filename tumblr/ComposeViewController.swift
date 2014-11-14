//
//  ComposeViewController.swift
//  tumblr
//
//  Created by diane cronenwett on 11/10/14.
//  Copyright (c) 2014 dianesorg. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

 
    
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var iconView: UIView!
    

    
    @IBAction func nevermindButton(sender: AnyObject) {
        //on tap of nevermind, the button flies up
            var y = textButton.frame.origin.y
        UIView.animateWithDuration(0.6, delay: 1.0, options: .CurveEaseOut, animations: {
            self.textButton.frame.origin.y = -99
            }, completion: { finished in
                self.dismissViewControllerAnimated(true, completion: nil)
                
        })

        
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
               

        
           }
        

        
        // Do any additional setup after loading the view.
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
