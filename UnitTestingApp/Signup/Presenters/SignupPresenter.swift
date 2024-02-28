//
//  SignupPresenter.swift
//  UnitTestingApp
//
//  Created by Evgeniy Zelinskiy on 27.02.2024.
//

import Foundation

class SignupPresenter: SignupPresenterProtocol {
    private var formModelValidator: SignupModelValidatorProtocol
    private var webservice: SignupWebServiceProtocol
    private weak var delegate: SignupViewDelegateProtocol? 
    
    required init(formModelValidator: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.webservice = webservice
        self.delegate = delegate
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            return
        }
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            return
        }
        if !formModelValidator.isValidEmailFormat(email: formModel.email) {
            return
        }
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            return
        }
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            return
        }
        
        let requestModel = SignupFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
        webservice.signup(withForm: requestModel) { [weak self] responseModel, error in
            if let signupError = error {
                self?.delegate?.errorHandler(error: signupError)
                return
            }
            if let _ = responseModel {
                self?.delegate?.successfullSignup()
            }
        }
    }
}
