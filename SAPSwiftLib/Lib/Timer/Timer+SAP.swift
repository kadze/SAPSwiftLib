//
//  Timer+SAP.swift
//  Prostoy
//
//  Created by ASH on 12/28/17.
//  Copyright © 2017 lexin. All rights reserved.
//

import Foundation

//timer retains the target which creates a retain cycle
//This is to break retain cycle
extension Timer {
    class func weakSheduledTimer(timeInterval ti: TimeInterval,
                                 target aTarget: AnyObject, //not Any
                                 selector aSelector: Selector,
                                 userInfo: Any?,
                                 repeats yesOrNo: Bool) -> Timer
    {
        let timerProxy = TimerProxy(target: aTarget, selector: aSelector)
        let timer = Timer.scheduledTimer(timeInterval: ti,
                                         target: timerProxy,
                                         selector: #selector(TimerProxy.onTimer(_:)),
                                         userInfo: userInfo,
                                         repeats: yesOrNo)
        
        return timer
    }
}

//EXAMPLE:
//class SomeClass {
//
//    private struct Constants {
//        static let timerInterval:TimeInterval = 1.0
//    }
//
//    var connectDurationUpdatingTimer: Timer?
//
//    private func startConnectDurationUpdatingTimer() {
//        DispatchQueue.main.async {[weak self] in
//            guard let weakSelf  = self else { return }
//            weakSelf.connectDurationUpdatingTimer = Timer.weakSheduledTimer(timeInterval: Constants.timerInterval,
//                                                                            target: weakSelf,
//                                                                            selector: #selector(self?.onTimer),
//                                                                            userInfo: nil,
//                                                                            repeats: true)
//        }
//    }
//
//    @objc private func onTimer() {
//        connectDuration.value = TelephonyUtils.string(from: activeCall?.connectDuration ?? 0)
//    }
//}
