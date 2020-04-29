//
//  main.swift
//  Created 4/28/20
//  Using Swift 5.0
// 
//  Copyright © 2020 yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation

let validators: [ValidatorOptions] = [.isLength(8),
                                      .hasDigit,
                                      .hasUppercase]
let validator = PasswordValidator(validators)

print("------------------------------------")
print("Welcome to the Password Validator!")
print("Enter your password to validate.")
print("Enter a blank line to exit.")
print("------------------------------------")
print(">", separator: "", terminator: "")

while let password = readLine() {
    guard password.isEmpty == false else { break }
    let result = validator.validate(password)
    switch result {
    case .success:
        print("Your password is valid!")
    case .failure(let error):
        print("Password invalid: \(error)")
    }
    print(">", separator: "", terminator: "")
}

print("Execution done, have a good day.")
