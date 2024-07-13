//
//  ChunkedTests.swift
//  
//
//  Created by Rukshan on 13/07/2024.
//

import XCTest

class ArrayChunkedTests: XCTestCase {
    
    func testChunkedWithExactDivision() {
        let array = [1, 2, 3, 4, 5, 6]
        let expectedChunks = [[1, 2], [3, 4], [5, 6]]
        XCTAssertEqual(array.chunked(into: 2), expectedChunks, "Failed to chunk array with exact division")
    }
    
    func testChunkedWithNonExactDivision() {
        let array = [1, 2, 3, 4, 5, 6, 7]
        let expectedChunks = [[1, 2], [3, 4], [5, 6], [7]]
        XCTAssertEqual(array.chunked(into: 2), expectedChunks, "Failed to chunk array with non-exact division")
    }
    
    func testChunkedWithSizeLargerThanArray() {
        let array = [1, 2, 3]
        let expectedChunks = [[1, 2, 3]]
        XCTAssertEqual(array.chunked(into: 5), expectedChunks, "Failed to chunk array when chunk size is larger than the array")
    }
    
    func testChunkedWithSizeOfOne() {
        let array = [1, 2, 3, 4, 5]
        let expectedChunks = [[1], [2], [3], [4], [5]]
        XCTAssertEqual(array.chunked(into: 1), expectedChunks, "Failed to chunk array with chunk size of one")
    }
    
    func testChunkedWithEmptyArray() {
        let array: [Int] = []
        let expectedChunks: [[Int]] = []
        XCTAssertEqual(array.chunked(into: 3), expectedChunks, "Failed to chunk an empty array")
    }
    
    func testChunkedWithZeroSize() {
        let array = [1, 2, 3]
        let expectedChunks: [[Int]] = []
        XCTAssertEqual(array.chunked(into: 0), expectedChunks, "Failed to return empty chunks when chunk size is zero")
    }
}

