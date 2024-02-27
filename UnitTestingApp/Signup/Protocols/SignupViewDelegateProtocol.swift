//
//  SignupViewDelegateProtocol.swift
//  UnitTestingApp
//
//  Created by Evgeniy Zelinskiy on 27.02.2024.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfullSignup()
    func errorHandler(error: SignupError)
}
