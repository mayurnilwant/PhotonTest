//
//  PhotonTestTests.swift
//  PhotonTestTests
//
//  Created by Mayur Nilwant on 30/01/2024.
//

import XCTest
@testable import PhotonTest

final class PhotonTestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    //Test
    func testSchoolEndPointUrlStringPositiveResult() throws {
        
//        let schoolEndPoint = SchoolResourceEndPoint(withQery: [:], andHttpOperation: .get)
//        
//        XCTAssertqual(schoolEndPoint.url?.absoluteString, "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")
        
        
    }
    
    func testSchoolListSerview() {
        
        let schoolEndPoint = SchoolResourceEndPoint(withQery: [:], andHttpOperation: .get)
        let schooService = SchoolService(endPoint: schoolEndPoint)
        
        let expectation = self.expectation(description: "School Service")
        Task {
            let schools = try await schooService.getSchools()
            if schools?.count != 0 {
                expectation.fulfill()
            }
            
        }
        waitForExpectations(timeout: 10)
        
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
