//
//  String+FormatterDateTests.swift
//  NextTunesTests
//
//  Created by Alexandre Cardoso on 21/09/21.
//

import XCTest
@testable import NextTunes

class FormatterDate_ExtensionTests: XCTestCase {
	
	func test_DateFormat_whenWrongDate_shouldReturnNil() {
		let sut: String? = "21.09-202"
		
		XCTAssertNil(sut?.formatterDate())
	}
	
	func test_DateFormatter_whenCorrectlyDate_shouldReturnStringSuccess() {
		let sut: String? = "2021-09-21"
		let expected: String? = "21/09/2021"
		
		XCTAssertNotNil(sut?.formatterDate())
		XCTAssertTrue(sut?.formatterDate() == expected)
	}
	
}
