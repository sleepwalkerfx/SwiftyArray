//
//  PartitionTests.swift
//  
//
//  Created by Rukshan on 13/07/2024.
//

import XCTest

final class PartitionTests: XCTestCase {
    func testPartitionedAllMatch() {
            let array = [2, 4, 6, 8]
            let (matching, nonMatching) = array.partitioned(by: { $0 % 2 == 0 })
            XCTAssertEqual(matching, array, "All elements should match the predicate")
            XCTAssertTrue(nonMatching.isEmpty, "No elements should be non-matching")
        }
        
        func testPartitionedNoneMatch() {
            let array = [1, 3, 5, 7]
            let (matching, nonMatching) = array.partitioned(by: { $0 % 2 == 0 })
            XCTAssertTrue(matching.isEmpty, "No elements should match the predicate")
            XCTAssertEqual(nonMatching, array, "All elements should be non-matching")
        }
        
        func testPartitionedSomeMatch() {
            let array = [1, 2, 3, 4, 5, 6]
            let (matching, nonMatching) = array.partitioned(by: { $0 % 2 == 0 })
            XCTAssertEqual(matching, [2, 4, 6], "Elements matching the predicate are incorrect")
            XCTAssertEqual(nonMatching, [1, 3, 5], "Elements not matching the predicate are incorrect")
        }
        
        func testPartitionedEmptyArray() {
            let array: [Int] = []
            let (matching, nonMatching) = array.partitioned(by: { $0 % 2 == 0 })
            XCTAssertTrue(matching.isEmpty, "Matching array should be empty")
            XCTAssertTrue(nonMatching.isEmpty, "Non-matching array should be empty")
        }
        
        func testPartitionedSingleElementArrayMatch() {
            let array = [2]
            let (matching, nonMatching) = array.partitioned(by: { $0 % 2 == 0 })
            XCTAssertEqual(matching, array, "Single element matching the predicate should be in the matching array")
            XCTAssertTrue(nonMatching.isEmpty, "Non-matching array should be empty")
        }
        
        func testPartitionedSingleElementArrayNoMatch() {
            let array = [1]
            let (matching, nonMatching) = array.partitioned(by: { $0 % 2 == 0 })
            XCTAssertTrue(matching.isEmpty, "Single element not matching the predicate should be in the non-matching array")
            XCTAssertEqual(nonMatching, array, "Non-matching array should contain the single element")
        }
        
        func testPartitionedWithStringArray() {
            let array = ["apple", "banana", "cherry"]
            let (matching, nonMatching) = array.partitioned(by: { $0.hasPrefix("b") })
            XCTAssertEqual(matching, ["banana"], "Matching elements in the string array are incorrect")
            XCTAssertEqual(nonMatching, ["apple", "cherry"], "Non-matching elements in the string array are incorrect")
        }

}
