//
//  SignupWebServiceProtocol.swift
//  UnitTestingApp
//
//  Created by Evgeniy Zelinskiy on 27.02.2024.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void)
}
