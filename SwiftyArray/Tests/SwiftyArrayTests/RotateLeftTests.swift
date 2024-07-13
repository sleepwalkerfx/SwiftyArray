//
//  RotateTests.swift
//
//
//  Created by Rukshan on 13/07/2024.
//

import XCTest

class ArrayRotatedTests: XCTestCase {
    
    func testRotatedByPositiveDistance() {
        let array = [1, 2, 3, 4, 5]
        let expectedArray = [3, 4, 5, 1, 2]
        XCTAssertEqual(array.rotatedLeft(by: 2), expectedArray, "Failed to rotate array by positive distance")
    }
    
    func testRotatedByNegativeDistance() {
        let array = [1, 2, 3, 4, 5]
        let expectedArray = [4, 5, 1, 2, 3]
        XCTAssertEqual(array.rotatedLeft(by: -2), expectedArray, "Failed to rotate array by negative distance")
    }
    
    func testRotatedByDistanceGreaterThanCount() {
        let array = [1, 2, 3, 4, 5]
        let expectedArray = [3, 4, 5, 1, 2]
        XCTAssertEqual(array.rotatedLeft(by: 7), expectedArray, "Failed to rotate array by distance greater than count")
    }
    
    func testRotatedByZeroDistance() {
        let array = [1, 2, 3, 4, 5]
        let expectedArray = [1, 2, 3, 4, 5]
        XCTAssertEqual(array.rotatedLeft(by: 0), expectedArray, "Failed to return the same array when distance is zero")
    }
    
    func testRotatedEmptyArray() {
        let array: [Int] = []
        let expectedArray: [Int] = []
        XCTAssertEqual(array.rotatedLeft(by: 3), expectedArray, "Failed to handle rotation of an empty array")
    }
    
    func testRotatedSingleElementArray() {
        let array = [1]
        let expectedArray = [1]
        XCTAssertEqual(array.rotatedLeft(by: 1), expectedArray, "Failed to handle rotation of a single-element array")
    }
}

