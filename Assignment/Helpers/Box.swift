//
//  Box.swift
//  totalitycorp
//
//  Created by Ketan on 28/01/20.
//  Copyright © 2020 Ketan Doiphode. All rights reserved.
//

import Foundation

class Box<T> {
typealias Listener = (T) -> Void
var listener: Listener?

func bind(listener: Listener?) {
    self.listener = listener
}

func bindAndFire(listener: Listener?) {
    self.listener = listener
    listener?(value)
}

var value: T {
    didSet {
        listener?(value)
    }
}

init(_ value: T) {
    self.value = value
}}
