//
//  String+Extensions.swift
//  SAPSwiftLib
//
//  Created by shevtsov on 30.03.2020.
//  Copyright © 2020 ASH. All rights reserved.
//

import Foundation

extension String {
  var isBlank: Bool { allSatisfy({ $0.isWhitespace }) }
}
