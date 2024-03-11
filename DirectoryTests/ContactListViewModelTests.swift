//
//  ContactListViewModelTests.swift
//  DirectoryTests
//
//  Created by Sweta Jaiswal on 05/03/24.
//

import XCTest
@testable import Directory

final class ContactListViewModelTests: XCTestCase {
    
    var sut: ContactListViewModel!
    var mockService: APIMockService!
    
    
    /// Setup
    override func setUp()  {
        super.setUp()
        
        mockService = APIMockService()
        sut = ContactListViewModel(service: mockService)
    }
    
    /// TearDown
    override func tearDown() {
        super.tearDown()
        
        mockService = nil
        sut = nil
    }
    
    
    /// Test if json file is available or not
    func testJsonFileNotFound() {
        /// Given
        mockService.contactResult = .failure(.jsonFileNotfound)
        /// When
        sut.fetchContactList()
        /// Then
        XCTAssertTrue(sut.contactList.isEmpty)
    }
    
    
    /// Fetching contact list
    func testFetchingContactListSuccess() {
        let expectation = self.expectation(description: "Testing successful fetching of contact list")
        
        mockService.jsonFileName = JsonMockResponses.contactList.rawValue
      
//        mockService.fetchContactList { result in
        mockService.fetchFromAPI([Contact].self) { result in
            switch result {
            case .success(let list):
                XCTAssertTrue(list.count > 0)
            case .failure(let error):
                XCTFail("Expected to be a success but got a failed with error: \(error)")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    
    /// Decoding error test
    func testDecodingErrorWhileFetchingContactList() {
        let expectation = self.expectation(description: "Testing decoding error while fetching contact list")
        
        mockService.jsonFileName = JsonMockResponses.invalidContactList.rawValue
       
//        mockService.fetchContactList { result in
        mockService.fetchFromAPI([Contact].self) { result in
            switch result {
            case .success(let contacts):
                XCTFail("Expected to be a failed test but got a success instead.")
            case .failure(let error):
                XCTAssertNotNil(error)
            } 
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
}
