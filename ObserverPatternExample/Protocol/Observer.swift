//
//  Observer.swift
//  ObserverPatternExample
//
//  Created by magicmon on 2017. 7. 4..
//  Copyright © 2017년 magicmon. All rights reserved.
//

protocol Observer: class {
    func update(_ temp: Float, density: Float)
}
