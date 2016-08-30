//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Rishi Masand on 10/13/15.
//  Copyright (c) 2015 Rishi Masand. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var getStartedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getStartedButton.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func setLocation(sender: AnyObject) {
        self.performSegueWithIdentifier("toLocationSet", sender: nil)
    }
}

