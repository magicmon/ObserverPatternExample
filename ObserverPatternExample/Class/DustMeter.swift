//
//  DustMeter.swift
//  ObserverPatternExample
//
//  Created by magicmon on 2017. 7. 4..
//  Copyright © 2017년 magicmon. All rights reserved.
//

import Foundation

class DustMeter: Observation {
    var temperature: Float = 0.0
    var density: Float = 0.0
    
    func notify() {
        for observer in observers {
            observer.update(temperature, density: density)
        }
    }
}
