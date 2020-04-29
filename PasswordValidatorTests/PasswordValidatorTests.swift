//
//  PasswordValidatorTests.swift
//  Created 4/28/20
//  Using Swift 5.0
// 
//  Copyright © 2020 yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import XCTest

class PasswordValidatorTests: XCTestCase {
    
    func testValidLength() {
        // Arrange
        let validator = PasswordValidator([.isLength(8)])
        let password = "12345678"
        
        // Act
        let result = validator.validate(password)
        
        // Assert
        switch result {
        case .success(let validated):
            XCTAssertEqual(validated, password)
        case .failure:
            XCTFail()
        }
    }
    
    func testValidDigit() {
        // Arrange
        let validator = PasswordValidator([.hasDigit])
        let password = "1"
        
        // Act
        let result = validator.validate(password)
        
        // Assert
        switch result {
            case .success(let validated):
                XCTAssertEqual(validated, password)
            case .failure:
                XCTFail()
        }
    }
    
    func testValidUppercase() {
        // Arrange
        let validator = PasswordValidator([.hasUppercase])
        let password = "A"
        
        // Act
        let result = validator.validate(password)
        
        // Assert
        switch result {
            case .success(let validated):
                XCTAssertEqual(validated, password)
            case .failure:
                XCTFail()
        }
    }
    
    func testInvalidLength() {
        // Arrange
        let validator = PasswordValidator([.isLength(8)])
        let password = "A"
        
        // Act
        let result = validator.validate(password)
        
        // Assert
        switch result {
        case .success:
            XCTFail()
        case .failure(let error):
            XCTAssertEqual(error, .tooShort)
        }
    }
    
    func testInvalidDigit() {
        // Arrange
        let validator = PasswordValidator([.hasDigit])
        let password = "A"
        
        // Act
        let result = validator.validate(password)
        
        // Assert
        switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error, .lacksDigit)
        }
    }
    
    func testInvalidUppercase() {
        // Arrange
        let validator = PasswordValidator([.hasUppercase])
        let password = "a"
        
        // Act
        let result = validator.validate(password)
        
        // Assert
        switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error, .lacksUppercase)
        }
    }
    
    func testCanInvalidAfterValidCase() {
        // Arrange
        let validators: [ValidatorOptions] = [.isLength(8),
                                              .hasDigit,
                                              .hasUppercase]
        let validator = PasswordValidator(validators)
        let password1 = "Password123"
        let password2 = "fishtaco"
        
        // Act
        let result1 = validator.validate(password1)
        let result2 = validator.validate(password2)
        
        // Assert
        switch result1 {
        case .success(let validated):
            XCTAssertEqual(validated, password1)
        case .failure:
            XCTFail()
        }
        if case .success = result2 {
            XCTFail()
        }
    }
    
}
