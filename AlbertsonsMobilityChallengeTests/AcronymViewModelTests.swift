//
//  AcronymViewModelTests.swift
//  AlbertsonsMobilityChallengeTests
//
//  Created by Osagie Obaze on 1/3/22.
//

import XCTest
@testable import AlbertsonsMobilityChallenge

class AcronymViewModelTests: XCTestCase {

    var viewModel: AcronymViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.viewModel = AcronymViewModel(network: MockNetworkManager())
        
    }

    override func tearDownWithError() throws {
        self.viewModel = nil
        try super.tearDownWithError()
    }
    
    func testSearchAcronymSuccess() {
        let expectation = XCTestExpectation(description: "Notify Success Binding")
        
        self.viewModel.bind {
            expectation.fulfill()
        } failureBinding: { _ in
            XCTFail()
        }
        
        XCTAssertEqual(self.viewModel.count, 0)
        XCTAssertNil(self.viewModel.fullForm(for: 0))
        self.viewModel.searchAcronym(acronym: "test")
        
        wait(for: [expectation], timeout: 3)
        
        XCTAssertEqual(self.viewModel.count, 1)
        XCTAssertEqual(self.viewModel.fullForm(for: 0), "Department of Energy")
    }
    
    func testSeachAcronymEmptyResultFailure() {
        let expectation = XCTestExpectation(description: "Notify Failure Binding with Empty Result")
        var networkError: NetworkError?
        
        self.viewModel.bind {
            
        } failureBinding: { error in
            networkError = error as? NetworkError
            expectation.fulfill()
        }
        self.viewModel.searchAcronym(acronym: NetworkError.emptyResult.urlTest)
        wait(for: [expectation], timeout: 3)
        
        XCTAssertEqual(networkError, NetworkError.emptyResult)
    }
    
    func testSeachAcronymGeneralFailure() {
        let expectation = XCTestExpectation(description: "Notify Failure Binding General")
        
        self.viewModel.bind {
            XCTFail()
        } failureBinding: { _ in
            expectation.fulfill()
        }
        self.viewModel.searchAcronym(acronym: NetworkError.badRequest.urlTest)
        wait(for: [expectation], timeout: 3)
    }
    
    func testSearchAcronymWithEmptyQuery() {
        self.viewModel.searchAcronym(acronym: "")
        XCTAssertEqual(self.viewModel.count, 0)
    }


}
