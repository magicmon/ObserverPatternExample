//
//  ViewController.swift
//  ObserverPatternExample
//
//  Created by magicmon on 2017. 7. 4..
//  Copyright © 2017년 magicmon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let dustMeter = DustMeter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let user1 = Subscriber(name: "Tom")
        let user2 = Subscriber(name: "Sam")
        let _ = Subscriber(name: "Kim")
        
        // add User
        dustMeter.addObserver(user1)
        dustMeter.addObserver(user2)
        
        // remove User
        dustMeter.removeObserver(user1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    @IBAction func clickedButton() {
        dustMeter.temperature = 32
        dustMeter.density = 80
        
        
        dustMeter.notify()
    }
}

