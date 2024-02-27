//
//  SignupFormModelValidatorTests.swift
//  UnitTestingAppTests
//
//  Created by Evgeniy Zelinskiy on 26.02.2024.
//

import XCTest
@testable import UnitTestingApp

final class SignupFormModelValidatorTests: XCTestCase {
    var sut: SignupFormModelValidator!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SignupFormModelValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    //MARK: - First Name Validation Unit Tests
    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        // Arrange - sut = SignupFormModelValidator()
        // Act
        let isValidFirstName = sut.isFirstNameValid(firstName: "Yevgen")
        // Accert
        XCTAssertTrue(isValidFirstName, "The isFirstNameValid() should have return TRUE for a valid first name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        // Arrange - sut = SignupFormModelValidator()
        // Act
        let isValidFirstName = sut.isFirstNameValid(firstName: "Y")
        // Assert
        XCTAssertFalse(isValidFirstName, "The isFirstNameValid() should have returned FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLength) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        // Arrange - sut = SignupFormModelValidator()
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "YevgenYevgen")
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer than \(SignupConstants.firstNameMaxLength) characters but it has returned TRUE")
    }
    
    //MARK: - Last Name Validation Unit Tests
    func testSignupFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        // Arrange - sut = SignupFormModelValidator()
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Zelinskiy")
        // Assert
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned TRUE for a valid last name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        // Arrange - sut = SignupFormModelValidator()
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Z")
        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is shorter than \(SignupConstants.lastNameMinLength) characters but it has returned TRUE")
        
    }
    
    func testSignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        // Arrange - sut = SignupFormModelValidator()
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "ZelinskiyZelinskiy")
        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is longer than \(SignupConstants.lastNameMaxLength) characters but it has returned TRUE")
    }
    
    // MARK: Email Address Validation
    func testSignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        // Arrange - sut = SignupFormModelValidator()
        // Act
        let isValidEmailFormat = sut.isValidEmailFormat(email: "test@test.com")
        // Assert
        XCTAssertTrue(isValidEmailFormat, "Provided valid email address format but validation did not pass")
    }
    
    func testSignupFormModelValidator_WhenInValidEmailProvided_ShouldReturnFalse() {
        // Arrange - sut = SignupFormModelValidator()
        // Act
        let isValidEmailFormat = sut.isValidEmailFormat(email: "test@test")
        // Assert
        XCTAssertFalse(isValidEmailFormat, "Provided invalid email address format but validation still passed")
    }
    
    // MARK: Password Validation
    func testSignupFormModelValidator_WhenValidPasswordProvided_ShouldReturnTrue() {
        // Arrange - sut = SignupFormModelValidator()
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "12345678")
        // Assert
        XCTAssertTrue(isPasswordValid, "The isPasswordValid() should have returned TRUE for a valid password  but it has returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        // Arrange - sut = SignupFormModelValidator()
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "12")
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is shorter than \(SignupConstants.passwordMinLength) but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        // Arrange - sut = SignupFormModelValidator()
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "12345678901234567")
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is longer than \(SignupConstants.passwordMaxLength) but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenEqualPasswordsProvided_ShouldReturnTrue() {
        // Arrange - sut = SignupFormModelValidator()
        // Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: "12345678", repeatPassword:"12345678")
        // Assert
        XCTAssertTrue(doPasswordsMatch, "The doPasswordsMatch() should have returned TRUE for matching passwords but it has returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenNotMatchingPasswordsProvided_ShouldReturnFalse() {
        // Arrange - sut = SignupFormModelValidator()
        // Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: "12345678", repeatPassword: "1234567")
        // Assert
        XCTAssertFalse(doPasswordsMatch, "The doPasswordsMatch() should have returned FALSE for passwords that do not match but it has returned TRUE")
    }
}
