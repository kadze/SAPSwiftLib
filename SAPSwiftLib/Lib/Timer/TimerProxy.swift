//
//  TimerProxy.swift
//  Prostoy
//
//  Created by ASH on 12/27/17.
//  Copyright © 2017 lexin. All rights reserved.
//

import Foundation

@objc class TimerProxy: NSObject {
    private(set) weak var target: AnyObject?
    private(set) weak var timer: Timer?
    let selector: Selector
    
    init(target: AnyObject, selector: Selector) {
        self.target = target
        self.selector = selector

        super.init()
    }
    
    @objc func onTimer(_ timer: Timer) {
        if let target = self.target {
            _ = target.perform(self.selector, with: timer)
        } else {
            timer.invalidate()
        }
    }
    
}
