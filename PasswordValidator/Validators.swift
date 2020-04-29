//
//  Validators.swift
//  Created 4/28/20
//  Using Swift 5.0
// 
//  Copyright © 2020 yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation

protocol Validator: AnyObject {
    var isValid: Bool { get set }
    func validate(_ character: Character)
    func finish() throws
    func reset()
}

extension Validator {
    func reset() {
        isValid = false
    }
}

class UppercaseValidator: Validator {
    var isValid: Bool = false
    
    func validate(_ character: Character) {
        if character.isUppercase {
            isValid = true
        }
    }
    
    func finish() throws {
        if isValid == false {
            throw PasswordValidationError.lacksUppercase
        }
    }
}
class DigitValidator: Validator {
    var isValid: Bool = false
    
    func validate(_ character: Character) {
        if character.isNumber {
            isValid = true
        }
    }
    func finish() throws {
        if isValid == false {
            throw PasswordValidationError.lacksDigit
        }
    }
}

class LengthValidator: Validator {
    private let length: Int
    private var currentLength: Int = 0
    var isValid: Bool = false
    
    init(_ length: Int) {
        self.length = length
    }
    
    func validate(_ character: Character) {
        currentLength += 1
        isValid = currentLength >= length
    }
    
    func finish() throws {
        if isValid == false {
            throw PasswordValidationError.tooShort
        }
    }
}
