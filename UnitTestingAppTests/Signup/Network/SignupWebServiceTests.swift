//
//  SignupWebServiceTests.swift
//  UnitTestingAppTests
//
//  Created by Evgeniy Zelinskiy on 26.02.2024.
//

import XCTest
@testable import UnitTestingApp

final class SignupWebServiceTests: XCTestCase {
    var sut: SignupWebService!
    var signupFormRequestModel: SignupFormRequestModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = SignupWebService(urlString: SignupConstants.signupURLString, urlSession: urlSession)
        signupFormRequestModel = SignupFormRequestModel(firstName: "Yevgen", lastName: "Zelinskiy", email: "test@test.com", password: "12345678")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        signupFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }
    
    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnsSuccess() {
        // Arraneg
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        // Act
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        sut.signup(withForm: signupFormRequestModel) { signupResponseModel, error in
            // Assert
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        // Arraneg
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        // Act
        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON structure")  
        sut.signup(withForm: signupFormRequestModel) { signupResponseModel, error in
            // Assert
            XCTAssertNil(signupResponseModel)
            XCTAssertEqual(error, SignupError.invalidResponseModel)
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSingupWebService_WhenEmptyURLStringProvided_ReturnsError() {
        // Arrange
        sut = SignupWebService(urlString: "")
        let expectation = self.expectation(description: "An empty request URL string expectation")
        // Act
        sut.signup(withForm: signupFormRequestModel) { signupResponseModel, error in
            // Assert
            XCTAssertNil(signupResponseModel)
            XCTAssertEqual(error, SignupError.invalidRequestURLString)
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 2)
    }
    
    func testSingupWebService_WhenURLRequestFails_ReturnsErrorMessageDescription() {
        // Arrange
        let expectation = self.expectation(description: "A failed request expectation")
        let errorDescription = "The operation couldn’t be completed. (UnitTestingApp.SignupError error 0.)" //"A localized description of an error"
        MockURLProtocol.error = SignupError.failedRequest(description:errorDescription)
        // Act
        sut.signup(withForm: signupFormRequestModel) { signupResponseModel, error in
            // Assert
            XCTAssertNil(signupResponseModel)
            XCTAssertEqual(error, SignupError.failedRequest(description:errorDescription))
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 2)
    }

}
