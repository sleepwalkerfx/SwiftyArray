//
//  IsSorted.swift
//  
//
//  Created by Rukshan on 13/07/2024.
//

import XCTest

final class IsSorted: XCTestCase {

  
    func testSortedArrayOfIntegers() {
        let array = [1, 2, 3, 4, 5]
        XCTAssertTrue(array.isSorted(), "The array should be sorted in non-decreasing order")
    }
    
    func testUnsortedArrayOfIntegers() {
        let array = [1, 3, 2, 4, 5]
        XCTAssertFalse(array.isSorted(), "The array should not be sorted in non-decreasing order")
    }
    
    func testArrayWithDuplicateElements() {
        let array = [1, 1, 2, 2, 3, 3]
        XCTAssertTrue(array.isSorted(), "The array with duplicate elements should be considered sorted")
    }
    
    func testEmptyArray() {
        let array: [Int] = []
        XCTAssertTrue(array.isSorted(), "An empty array should be considered sorted")
    }
    
    func testSingleElementArray() {
        let array = [1]
        XCTAssertTrue(array.isSorted(), "A single-element array should be considered sorted")
    }
    
    func testArrayWithOneUnsortedPair() {
        let array = [1, 3, 2]
        XCTAssertFalse(array.isSorted(), "The array with a single unsorted pair should not be considered sorted")
    }
    
    func testArrayOfStringsSorted() {
        let array = ["apple", "banana", "cherry"]
        XCTAssertTrue(array.isSorted(), "The array of strings should be sorted in lexicographic order")
    }
    
    func testArrayOfStringsUnsorted() {
        let array = ["banana", "apple", "cherry"]
        XCTAssertFalse(array.isSorted(), "The array of strings should not be sorted in lexicographic order")
    }

}
