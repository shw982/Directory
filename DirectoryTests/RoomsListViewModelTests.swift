//
//  RoomsListViewModelTests.swift
//  DirectoryTests
//
//  Created by Sweta Jaiswal on 05/03/24.
//

import XCTest
@testable import Directory

final class RoomsListViewModelTests: XCTestCase {
    
    var mockService: APIMockService!
    var sut: RoomListViewModel!
    
    
    /// Setup
    override func setUp() {
        super.setUp()
        
        mockService = APIMockService()
        sut = RoomListViewModel(service: mockService)
    }

    /// TearDown
    override func tearDown() {
        super.tearDown()
        
        mockService = nil
        sut = nil
    }

    
    /// Read from JSON file
    func testJsonFileNotFound() {
        /// Given
        mockService.roomResult = .failure(.jsonFileNotfound)
        /// When
        sut.fetchRoomList()
        /// Then
        XCTAssertTrue(sut.roomList.isEmpty)
    }
    
    
    /// Fetch room list
    func testFetchRoomListSuccess() {
        let expectation = self.expectation(description: "Fetching room list")
        
        mockService.jsonFileName = JsonMockResponses.roomList.rawValue
      
//        mockService.fetchRoomList { result in
      mockService.fetchFromAPI([Room].self) { result in
            switch result {
            case .success(let rooms):
                XCTAssertTrue(rooms.count > 0)
            case .failure(let error):
                XCTFail("Expected to be a success but got a failed with error: \(error)")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }

    
    /// Decoding error test
    func testDecodingErrorWhileFetchingContactList() {
        let expectation = self.expectation(description: "Testing decoding error while fetching room list")
        
        mockService.jsonFileName = JsonMockResponses.invalidRoomList.rawValue
       
        mockService.fetchFromAPI([Room].self) { result in
//        mockService.fetchContactList { result in
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
