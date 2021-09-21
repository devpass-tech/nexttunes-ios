//
//  String+FormatterDateTests.swift
//  NextTunesTests
//
//  Created by Alexandre Cardoso on 21/09/21.
//

import XCTest
@testable import NextTunes

class FormatterDate_ExtensionTests: XCTestCase {
	
	func test_wrongDateFormatShouldReturnNil() {
		let sut: String? = "21.09.2021"
		
		XCTAssertNil(sut?.formatterDate())
	}
	
	func test_DateFormatShouldReturnString() {
		let sut: String? = "2021-09-21"
		let expected: String? = "21/09/2021"
		
		XCTAssertNotNil(sut?.formatterDate())
		XCTAssertTrue(sut?.formatterDate() == expected)
	}
	
}
