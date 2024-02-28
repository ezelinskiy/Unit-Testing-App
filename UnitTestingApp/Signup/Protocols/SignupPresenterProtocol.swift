//
//  SignupPresenterProtocol.swift
//  UnitTestingApp
//
//  Created by Evgeniy Zelinskiy on 28.02.2024.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    init(formModelValidator: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol)
    func processUserSignup(formModel: SignupFormModel)
}
