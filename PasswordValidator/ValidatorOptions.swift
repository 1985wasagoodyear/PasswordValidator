//
//  ValidatorOptions.swift
//  Created 4/28/20
//  Using Swift 5.0
// 
//  Copyright © 2020 yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation

enum ValidatorOptions {
    case hasUppercase
    case hasDigit
    case isLength(Int)
    
    func makeValidator() -> Validator {
        switch self {
            case .hasUppercase:
                return UppercaseValidator()
            case .hasDigit:
                return DigitValidator()
            case .isLength(let length):
                return LengthValidator(length)
        }
    }
}
