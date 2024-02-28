//
//  MockSignupPresenter.swift
//  UnitTestingAppTests
//
//  Created by Evgeniy Zelinskiy on 28.02.2024.
//

import Foundation
@testable import UnitTestingApp

class MockSignupPresenter: SignupPresenterProtocol {
    var processUserSignupCalled: Bool = false
    required init(formModelValidator: UnitTestingApp.SignupModelValidatorProtocol, webservice: UnitTestingApp.SignupWebServiceProtocol, delegate: UnitTestingApp.SignupViewDelegateProtocol) {
        //
    }
    
    func processUserSignup(formModel: UnitTestingApp.SignupFormModel) {
        processUserSignupCalled = true
    }
}
