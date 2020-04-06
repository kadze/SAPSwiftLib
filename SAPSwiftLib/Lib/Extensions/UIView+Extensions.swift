//
//  UIView+Extensions.swift
//  SAPSwiftLib
//
//  Created by shevtsov on 06.04.2020.
//  Copyright © 2020 ASH. All rights reserved.
//

import UIKit

extension UIView {
    
    //example usage roundView.roundCorners(corners: [.topLeft, .topRight], radius: 15)
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    //example corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    @available(iOS 11, *)
    func roundCornersIOS11(corners: CACornerMask, radius: CGFloat) {
        clipsToBounds = false
        layer.cornerRadius = radius
        layer.maskedCorners = corners
    }
}
