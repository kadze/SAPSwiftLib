//
//  TimerUtil.swift
//  Prostoy
//
//  Created by Denis Kuznetsov on 31.10.17.
//  Copyright © 2017 lexin. All rights reserved.
//

import Foundation

//just global convenient function to use Timer.sheduledTimer
public func invoke( selector:Selector, on target:AnyObject, afterDelay delay:TimeInterval ) {
    
    Timer.scheduledTimer( timeInterval: delay, target: target, selector: selector, userInfo: nil, repeats: false )
}

//EXAMPLE
//anywhere in code just call like this to use non-repeating timer
//invoke(selector: #selector(self.loadCrmRecords), on:self, afterDelay:1.0)
