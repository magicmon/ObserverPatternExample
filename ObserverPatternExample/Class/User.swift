//
//  User.swift
//  ObserverPatternExample
//
//  Created by magicmon on 2017. 7. 4..
//  Copyright © 2017년 magicmon. All rights reserved.
//

import Foundation

class User: Observer {
    
    var name: String = ""
    
    func update(_ temp: Float, density: Float) {
        print("name: \(name), temp: \(temp) density: \(density)")
    }
    
    init(name: String) {
        self.name = name
    }
}
