//
//  TopEventsTests.swift
//  TopEventsTests
//
//  Created by Gabriel Bernardo Pereira on 21/11/18.
//  Copyright © 2018 Gabriel Bernardo Pereira. All rights reserved.
//

import XCTest
@testable import TopEvents

class TopEventsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParseDates() {
        let mockISODate1 = "2017-11-07T08:15:00Z".parseISODate()
        let mockISODate2 = "2018-05-07T02:00:00Z".parseISODate()

        XCTAssertEqual(1510042500.0, mockISODate1?.timeIntervalSince1970)
        XCTAssertEqual(1525658400.0, mockISODate2?.timeIntervalSince1970)
    }
    
    func testStringDateToFormat() {
        let mockISODate1 = "2017-11-07T08:15:00Z".parseISODate()
        let mockISODate2 = "2018-05-07T02:00:00Z".parseISODate()
        
        XCTAssertEqual("Tuesday 7 Nov 2017 - 08:15", mockISODate1?.toString())
        XCTAssertEqual("Monday 7 May 2018 - 02:00", mockISODate2?.toString())
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
