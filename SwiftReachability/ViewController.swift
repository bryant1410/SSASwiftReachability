//
//  ViewController.swift
//  SSASwiftReachability
//
//  Created by Sebastian Andersen on 05/02/15.
//  Copyright (c) 2015 SebastianAndersen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Storyboard Variables 
    @IBOutlet weak var reachabilityStatusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Listen For Network Reachability Changes
        NotificationCenter.default.addObserver(self, selector: Selector(("reachabilityStatusChanged:")), name: NSNotification.Name(rawValue: SSAReachabilityDidChangeNotification), object: nil)
    }
    
    func reachabilityStatusChanged(notification: NSNotification) {
        if let info = notification.userInfo {

            if let s = info[SSAReachabilityNotificationStatusItem] {
                reachabilityStatusLabel.text = (s as AnyObject).description
            }
        }
    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

