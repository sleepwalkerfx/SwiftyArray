//
//  SafeTests.swift
//  
//
//  Created by Rukshan on 13/07/2024.
//
import XCTest
@testable import SwiftyArray

class ArraySafeSubscriptTests: XCTestCase {

    func testSafeSubscriptWithinBounds() {
        let array = [1, 2, 3, 4, 5]
        XCTAssertEqual(array[safe: 0], 1)
        XCTAssertEqual(array[safe: 2], 3)
        XCTAssertEqual(array[safe: 4], 5)
    }

    func testSafeSubscriptOutOfBounds() {
        let array = [1, 2, 3, 4, 5]
        XCTAssertNil(array[safe: -1])
        XCTAssertNil(array[safe: 5])
        XCTAssertNil(array[safe: 100])
    }

    func testSafeSubscriptEmptyArray() {
        let array: [Int] = []
        XCTAssertNil(array[safe: 0])
        XCTAssertNil(array[safe: 1])
        XCTAssertNil(array[safe: -1])
    }

    func testSafeSubscriptWithStrings() {
        let array = ["a", "b", "c"]
        XCTAssertEqual(array[safe: 0], "a")
        XCTAssertEqual(array[safe: 2], "c")
        XCTAssertNil(array[safe: 3])
    }

    func testSafeSubscriptWithCustomObjects() {
        struct CustomObject: Equatable {
            let id: Int
        }

        let array = [CustomObject(id: 1), CustomObject(id: 2), CustomObject(id: 3)]
        XCTAssertEqual(array[safe: 1], CustomObject(id: 2))
        XCTAssertNil(array[safe: 3])
    }
}
