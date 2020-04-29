//
//  PasswordValidator.swift
//  Created 4/28/20
//  Using Swift 5.0
// 
//  Copyright © 2020 yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation

struct PasswordValidator {
    
    private let validators: [Validator]
    
    init(_ validatorOptions: [ValidatorOptions]) {
        validators = validatorOptions.map { $0.makeValidator() }
    }
    
    func validate(_ password: String) -> PasswordResult {
        defer { validators.forEach { $0.reset() } }
        for char in password {
            validators.forEach { $0.validate(char) }
        }
        do {
            try validators.forEach { try $0.finish() }
        } catch (let error as PasswordValidationError) {
            return .failure(error)
        } catch {
            return .failure(.unknown)
        }
        return .success(password)
    }
}
