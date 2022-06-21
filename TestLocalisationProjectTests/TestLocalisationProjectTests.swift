//
//  TestLocalisationProjectTests.swift
//  TestLocalisationProjectTests
//
//  Created by Kanstantsin Ausianovich on 21.06.22.
//

import XCTest
@testable import TestLocalisationProject

class TestLocalisationProjectTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testUKFileLabelLocalisation() {
        let sut = ViewController()

        let uploadButtonLabel = sut.testLabel.text

        XCTAssertEqual(uploadButtonLabel, "test_key_ukrainian")
    }
    
    func testENFileButtonLocalisation() {
        let sut = ViewController()

        let uploadButtonLabel = sut.testLabel.text

        XCTAssertEqual(uploadButtonLabel, "test_key_english")
    }
}
