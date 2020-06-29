//
//  Box.swift
//  Assignment
//
//  Created by Saurabh Borate on 28/06/20.
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
