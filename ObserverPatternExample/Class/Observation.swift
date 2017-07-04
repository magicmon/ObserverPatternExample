//
//  Observation.swift
//  ObserverPatternExample
//
//  Created by magicmon on 2017. 7. 4..
//  Copyright © 2017년 magicmon. All rights reserved.
//

import Foundation

class Observation: Observable {
    var observers = [Observer]()
    
    func addObserver(_ observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(_ observer: Observer) {
        observers = observers.filter({ $0 !== observer })
    }
}
