//
//  RemoveDuplicatesTests.swift
//  
//
//  Created by Rukshan on 20/06/2024.
//

import XCTest
@testable import SwiftyArray

final class RemoveDuplicatesTests: XCTestCase {

    func testRemovingDuplicates_emptyArray() {
           let emptyArray: [Int] = []
           let result = emptyArray.removingDuplicates()
           XCTAssertTrue(result.isEmpty, "Expected empty array for removing duplicates from an empty array")
       }
       
       func testRemovingDuplicates_noDuplicates() {
           let array = [1, 2, 3, 4, 5]
           let result = array.removingDuplicates()
           XCTAssertEqual(result, array, "Expected original array since there are no duplicates")
       }
       
       func testRemovingDuplicates_withDuplicates() {
           let array = [1, 2, 3, 2, 4, 1, 5, 3]
           let expectedResult = [1, 2, 3, 4, 5]
           let result = array.removingDuplicates()
           XCTAssertEqual(result, expectedResult, "Expected array with duplicates removed")
       }
       
       func testRemovingDuplicates_strings() {
           let array = ["apple", "banana", "orange", "apple", "kiwi"]
           let expectedResult = ["apple", "banana", "orange", "kiwi"]
           let result = array.removingDuplicates()
           XCTAssertEqual(result, expectedResult, "Expected array with duplicates removed for strings")
       }
    
    func testRemovingDuplicatesFromArrayWithIntegers() {
        let array = [1, 2, 2, 3, 3, 3, 4, 5, 5]
        let expectedArray = [1, 2, 3, 4, 5]
        XCTAssertEqual(array.removingDuplicates(), expectedArray, "Failed to remove duplicates from array of integers")
    }
    
    func testRemovingDuplicatesFromArrayWithStrings() {
        let array = ["a", "b", "a", "c", "b", "d"]
        let expectedArray = ["a", "b", "c", "d"]
        XCTAssertEqual(array.removingDuplicates(), expectedArray, "Failed to remove duplicates from array of strings")
    }
    
    func testRemovingDuplicatesFromArrayWithCustomObjects() {
        struct CustomObject: Equatable {
            let id: Int
        }
        
        let array = [CustomObject(id: 1), CustomObject(id: 2), CustomObject(id: 1), CustomObject(id: 3), CustomObject(id: 2)]
        let expectedArray = [CustomObject(id: 1), CustomObject(id: 2), CustomObject(id: 3)]
        XCTAssertEqual(array.removingDuplicates(), expectedArray, "Failed to remove duplicates from array of custom objects")
    }
    
    func testRemovingDuplicatesFromArrayWithNoDuplicates() {
        let array = [1, 2, 3, 4, 5]
        let expectedArray = [1, 2, 3, 4, 5]
        XCTAssertEqual(array.removingDuplicates(), expectedArray, "Failed with an array that has no duplicates")
    }
    
    func testRemovingDuplicatesFromEmptyArray() {
        let array: [Int] = []
        let expectedArray: [Int] = []
        XCTAssertEqual(array.removingDuplicates(), expectedArray, "Failed with an empty array")
    }
}
