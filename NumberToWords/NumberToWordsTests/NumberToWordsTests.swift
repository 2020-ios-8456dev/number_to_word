//
//  NumberToWordsTests.swift
//  NumberToWordsTests
//
//  Created by 2020.ios.8456dev on 2/6/20.
//  Copyright © 2020 CG. All rights reserved.
//

import XCTest
@testable import NumberToWords

class NumberToWordsTests: XCTestCase {
    let converter = Converter()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidConversion() {
        let result = converter.convert(1)
        XCTAssertEqual(result, "One", "Conversion for 1 is incorrect")
    }
    
    func testValidConversionInRange() {
        let result = converter.convert(999999)
        XCTAssertEqual(result, "nine hundred ninety-nine thousand nine hundred ninety-nine", "Conversion for 999999 is incorrect")
    }
    
    
}
