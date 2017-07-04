//
//  Observable.swift
//  ObserverPatternExample
//
//  Created by magicmon on 2017. 7. 4..
//  Copyright © 2017년 magicmon. All rights reserved.
//

protocol Observable {
    func addObserver(_ observer: Observer)
    func removeObserver(_ observer: Observer)
}
