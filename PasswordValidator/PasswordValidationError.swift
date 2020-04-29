//
//  PasswordValidationError.swift
//  Created 4/28/20
//  Using Swift 5.0
// 
//  Copyright © 2020 yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation

enum PasswordValidationError: Error {
    case lacksUppercase
    case lacksDigit
    case tooShort
    case unknown
}

typealias PasswordResult = Result<String, PasswordValidationError>
