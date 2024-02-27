//
//  SignupFormRequestModel.swift
//  UnitTestingApp
//
//  Created by Evgeniy Zelinskiy on 26.02.2024.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
