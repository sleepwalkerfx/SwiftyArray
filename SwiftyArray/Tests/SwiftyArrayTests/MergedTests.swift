//
//  MergedTests.swift
//  
//
//  Created by Rukshan on 13/07/2024.
//

import XCTest

final class MergedTests: XCTestCase {

    func testMergeWithEmptyArray() {
          let array1 = [1, 2, 3]
          let array2: [Int] = []
          XCTAssertEqual(array1.mergedAvoidingDuplicates(with: array2), array1, "Merging with an empty array should return the original array")
      }
      
      func testMergeWithNonEmptyArray() {
          let array1 = [1, 2, 3]
          let array2 = [3, 4, 5]
          let expectedArray = [1, 2, 3, 4, 5]
          XCTAssertEqual(array1.mergedAvoidingDuplicates(with: array2), expectedArray, "Merging two arrays should combine unique elements")
      }
      
      func testMergeWithCommonElements() {
          let array1 = [1, 2, 3]
          let array2 = [3, 4, 5]
          let expectedArray = [1, 2, 3, 4, 5]
          XCTAssertEqual(array1.mergedAvoidingDuplicates(with: array2), expectedArray, "Merging arrays with common elements should remove duplicates")
      }
      
      func testMergeWithDuplicates() {
          let array1 = [1, 2, 3]
          let array2 = [3, 3, 4, 5]
          let expectedArray = [1, 2, 3, 4, 5]
          XCTAssertEqual(array1.mergedAvoidingDuplicates(with: array2), expectedArray, "Merging arrays with duplicates should remove duplicates")
      }
      
      func testMergeWithEmptySelf() {
          let array1: [Int] = []
          let array2 = [3, 4, 5]
          XCTAssertEqual(array1.mergedAvoidingDuplicates(with: array2), array2, "Merging with an empty array as self should return the other array")
      }
      
      func testMergeWithEmptyBoth() {
          let array1: [Int] = []
          let array2: [Int] = []
          XCTAssertEqual(array1.mergedAvoidingDuplicates(with: array2), array1, "Merging two empty arrays should return an empty array")
      }
      
      func testMergeWithEmptyBothDifferentType() {
          let array1: [String] = []
          let array2: [String] = []
          XCTAssertEqual(array1.mergedAvoidingDuplicates(with: array2), array1, "Merging two empty arrays of different types should return an empty array")
      }

}
