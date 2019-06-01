//
//  ViewController.swift
//  timeCapsel
//
//  Created by 岡本航輝 on 2016/08/26.
//  Copyright © 2016年 mycompany. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
     var tim="0"
    
    @IBAction func threemonth(_ sender: AnyObject) {
        tim="3"
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let viewController2=segue.destinationViewController as! ViewController2
            viewController2.tim2 = tim
    }
    */
    

}

