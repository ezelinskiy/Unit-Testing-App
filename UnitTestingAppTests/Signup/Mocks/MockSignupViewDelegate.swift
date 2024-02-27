//
//  MockSignupViewDelegate.swift
//  UnitTestingAppTests
//
//  Created by Evgeniy Zelinskiy on 27.02.2024.
//

import Foundation
import XCTest
@testable import UnitTestingApp

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    var expectation: XCTestExpectation?
    var successfulSignupCounter = 0
    var errorHandlerCounter = 0
    var signupError: SignupError?
    
    func successfullSignup() {
        successfulSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: UnitTestingApp.SignupError) {
        signupError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
    }
}
