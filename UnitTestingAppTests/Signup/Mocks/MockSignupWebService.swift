//
//  MockSignupWebService.swift
//  UnitTestingAppTests
//
//  Created by Evgeniy Zelinskiy on 27.02.2024.
//

import Foundation
@testable import UnitTestingApp

class MockSignupWebService: SignupWebServiceProtocol {
    var isSignupMethodCalled: Bool = false
    var shouldReturnError: Bool = false
    
    func signup(withForm formModel: UnitTestingApp.SignupFormRequestModel, completionHandler: @escaping (UnitTestingApp.SignupResponseModel?, UnitTestingApp.SignupError?) -> Void) {
        isSignupMethodCalled = true
        
        if shouldReturnError {
            completionHandler(nil, SignupError.failedRequest(description: "Signup request was not successful"))
        } else {
            let responseModel = SignupResponseModel(status: "Ok")
            completionHandler(responseModel, nil)
        }
    }
}
