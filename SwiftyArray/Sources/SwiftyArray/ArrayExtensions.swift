//
//  ArrayExtensions.swift
//  SwiftyArray
//
//  Created by Rukshan on 20/06/2024.
//

import Foundation

/**
 Safe subscripting for arrays to avoid index out of range errors.
 
 This subscript allows safe access to array elements by checking if the index is within bounds.
 
 - parameter index: The index of the element to access.
 - returns: The element at the specified index, or nil if the index is out of bounds.
 */
public extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

/**
 Remove duplicate elements from the array.
 
 This function removes duplicate elements while preserving the order of elements in the array.
 
 - returns: An array with duplicate elements removed.
 */
public extension Array where Element: Equatable {
    func removingDuplicates() -> [Element] {
        var result = [Element]()
        for value in self {
            if !result.contains(value) {
                result.append(value)
            }
        }
        return result
    }
}


/**
 Split the array into chunks of a specified size.
 
 This function divides the array into chunks, each containing a maximum of the specified size.
 
 - parameter size: The maximum size of each chunk.
 - returns: An array of arrays, each containing elements from the original array.
 */
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        var chunks = [[Element]]()
        for i in stride(from: 0, to: count, by: size) {
            let chunk = Array(self[i..<Swift.min(i + size, count)])
            chunks.append(chunk)
        }
        return chunks
    }
}

/**
 Filter out non-nil values from an array of optionals.
 
 This function removes `nil` values from an array of optionals, returning an array of non-optional values.
 
 - returns: An array containing only non-nil values.
 */
extension Array {
    func compactMap<T>() -> [T] where Element == Optional<T> {
        return self.compactMap { $0 }
    }
}

/**
 Rotate the elements of the array by a specified distance.
 
 This function rotates the elements of the array to the left or right based on the specified distance.
 
 - parameter distance: The distance by which to rotate the elements. A positive value rotates to the left; a negative value rotates to the right.
 - returns: The rotated array.
 */
extension Array {
    func rotated(by distance: Int) -> [Element] {
        guard !isEmpty else { return self }
        let adjustedDistance = distance % count
        if adjustedDistance == 0 { return self }
        let negativeDistance = adjustedDistance < 0 ? adjustedDistance + count : adjustedDistance
        let splitIndex = index(startIndex, offsetBy: negativeDistance)
        return Array(self[splitIndex ..< endIndex] + self[startIndex ..< splitIndex])
    }
}

/**
 Check if the array is sorted.
 
 This function checks whether the elements of the array are sorted in ascending order.
 
 - returns: `true` if the array is sorted in ascending order, `false` otherwise.
 */
extension Array where Element: Comparable {
    func isSorted() -> Bool {
        for i in 1..<count {
            if self[i] < self[i - 1] {
                return false
            }
        }
        return true
    }
}

/**
 Merge the array with another array, avoiding duplicates.
 
 This function merges the elements of the array with another array, ensuring that no duplicate elements are included.
 
 - parameter other: The array to merge with.
 - returns: A merged array containing unique elements from both arrays.
 */
extension Array where Element: Equatable {
    func merged(with other: [Element]) -> [Element] {
        var result = self
        for element in other {
            if !result.contains(element) {
                result.append(element)
            }
        }
        return result
    }
}

/**
 Partition the array into two arrays based on a predicate.
 
 This function partitions the elements of the array into two arrays based on whether they satisfy the given predicate.
 
 - parameter predicate: A closure that takes an element as its argument and returns a Boolean value indicating which partition the element should belong to.
 - returns: A tuple containing two arrays: one with elements that satisfy the predicate, and one with elements that do not.
 */
extension Array {
    func partitioned(by predicate: (Element) -> Bool) -> ([Element], [Element]) {
        var matching = [Element]()
        var nonMatching = [Element]()
        for element in self {
            if predicate(element) {
                matching.append(element)
            } else {
                nonMatching.append(element)
            }
        }
        return (matching, nonMatching)
    }
}

/**
 Calculate the sum of elements in the array.
 
 This function calculates the sum of all elements in the array.
 
 - returns: The sum of elements in the array.
 */
extension Array where Element: Numeric {
    func sum() -> Element {
        return reduce(0, +)
    }
}

/**
 Transpose a 2D array.
 
 This function transposes a 2D array, swapping rows with columns.
 
 - returns: The transposed 2D array.
 */
extension Array where Element: Collection, Element.Index == Int {
    func transposed() -> [[Element.Element]] {
        guard let firstRow = self.first else { return [] }
        return firstRow.indices.map { index in
            self.map { $0[index] }
        }
    }
}

/**
 Insert elements at regular intervals into the array.
 
 This function inserts elements at regular intervals into the array.
 
 - parameter element: The element to insert.
 - parameter interval: The interval at which to insert the element.
 - returns: An array with elements inserted at the specified intervals.
 */
extension Array {
    func inserting(_ element: Element, atEvery interval: Int) -> [Element] {
        guard interval > 0 else { return self }
        var result = [Element]()
        for (index, value) in enumerated() {
            result.append(value)
            if (index + 1) % interval == 0 {
                result.append(element)
            }
        }
        return result
    }
}

/**
 Remove elements from the array that satisfy a given predicate.
 
 This function removes elements from the array that satisfy the given predicate.
 
 - parameter condition: A closure that takes an element as its argument and returns a Boolean value indicating whether the element should be removed.
 */
extension Array {
    mutating func remove(where condition: (Element) -> Bool) {
        self = self.filter { !condition($0) }
    }
}

/**
 Find the minimum and maximum elements in the array.
 
 This function finds the minimum and maximum elements in the array.
 
 - returns: A tuple containing the minimum and maximum elements in the array, or nil if the array is empty.
 */
extension Array where Element: Comparable {
    func minMax() -> (min: Element, max: Element)? {
        guard let first = self.first else { return nil }
        var min = first
        var max = first
        for element in self.dropFirst() {
            if element < min {
                min = element
            } else if element > max {
                max = element
            }
        }
        return (min, max)
    }
}

/**
 Check if all elements in the array satisfy a given predicate.
 
 This function checks if all elements in the array satisfy the given predicate.
 
 - parameter predicate: A closure that takes an element as its argument and returns a Boolean value indicating whether the element satisfies a condition.
 - returns: `true` if all elements satisfy the predicate, `false` otherwise.
 */
extension Array {
    func allSatisfy(_ predicate: (Element) -> Bool) -> Bool {
        for element in self {
            if !predicate(element) {
                return false
            }
        }
        return true
    }
}

/**
 Check if any element in the array satisfies a given predicate.
 
 This function checks if any element in the array satisfies the given predicate.
 
 - parameter predicate: A closure that takes an element as its argument and returns a Boolean value indicating whether the element satisfies a condition.
 - returns: `true` if any element satisfies the predicate, `false` otherwise.
 */
extension Array {
    func anySatisfy(_ predicate: (Element) -> Bool) -> Bool {
        for element in self {
            if predicate(element) {
                return true
            }
        }
        return false
    }
}

/**
 Deeply flatten a nested array of arrays.
 
 This function flattens a nested array of arrays into a single-dimensional array.
 
 - returns: A flattened array containing all elements from nested arrays.
 */
extension Array where Element: Collection, Element.Element: Collection {
    func deepFlattened() -> [Element.Element] {
        return self.flatMap { $0 }
    }
}

/**
 Count the number of elements that satisfy a given condition.
 
 This function counts the number of elements in the array that satisfy the given condition.
 
 - parameter predicate: A closure that takes an element as its argument and returns a Boolean value indicating whether the element satisfies a condition.
 - returns: The number of elements that satisfy the predicate.
 */
extension Array {
    func count(where predicate: (Element) -> Bool) -> Int {
        return self.filter(predicate).count
    }
}

/**
 Find the index of the first element that satisfies a given condition.
 
 This function finds the index of the first element in the array that satisfies the given condition.
 
 - parameter predicate: A closure that takes an element as its argument and returns a Boolean value indicating whether the element satisfies a condition.
 - returns: The index of the first matching element, or nil if no element satisfies the predicate.
 */
extension Array {
    func firstIndex(where predicate: (Element) -> Bool) -> Int? {
        for (index, element) in self.enumerated() {
            if predicate(element) {
                return index
            }
        }
        return nil
    }
}

/**
 Remove elements at specified indices from the array.
 
 This function removes elements from the array at the specified indices.
 
 - parameter indices: A set of indices indicating the positions of elements to remove.
 */
extension Array {
    mutating func remove(at indices: Set<Int>) {
        self = self.enumerated().filter { !indices.contains($0.offset) }.map { $0.element }
    }
}

/**
 Reverse the elements of the array in place.
 
 This function reverses the order of elements in the array in place.
 */
extension Array {
    mutating func reverseInPlace() {
        guard count > 1 else { return }
        for i in 0..<(count / 2) {
            swapAt(i, count - i - 1)
        }
    }
}

/**
 Calculate the average of elements in the array.
 
 This function calculates the average of numeric elements in the array.
 
 - returns: The average of elements in the array, or nil if the array is empty.
 */
extension Array where Element: BinaryInteger {
    func average() -> Double? {
        guard !isEmpty else { return nil }
        let sum = Double(reduce(0, +))
        return sum / Double(count)
    }
}

/**
 Calculate the median of elements in the array.
 
 This function calculates the median of numeric elements in the array.
 
 - returns: The median of elements in the array, or nil if the array is empty.
 */
extension Array where Element: BinaryInteger {
    func median() -> Double? {
        guard !isEmpty else { return nil }
        let sorted = self.sorted()
        let middle = count / 2
        if count % 2 == 0 {
            return Double(sorted[middle] + sorted[middle - 1]) / 2.0
        } else {
            return Double(sorted[middle])
        }
    }
}

/**
 Calculate the mode (most frequent element) in the array.
 
 This function calculates the mode of elements in the array.
 
 - returns: The mode of elements in the array, or nil if the array is empty.
 */
extension Array where Element: Hashable {
    func mode() -> Element? {
        let counts = reduce(into: [:]) { $0[$1, default: 0] += 1 }
        return counts.max { $0.value < $1.value }?.key
    }
}

/**
 Convert an array of key-value pairs into a dictionary.
 
 This function converts an array of key-value pairs into a dictionary.
 
 - returns: A dictionary containing the elements of the array as key-value pairs.
 */
extension Array where Element == (key: String, value: Any) {
    func toDictionary() -> [String: Any] {
        var dict = [String: Any]()
        for pair in self {
            dict[pair.key] = pair.value
        }
        return dict
    }
}
/**
 Find the longest and shortest strings in the array.
 
 This function finds the longest and shortest strings in an array of strings.
 
 - returns: A tuple containing the longest and shortest strings in the array, or nil if the array is empty.
 */
extension Array where Element == String {
    func longestAndShortest() -> (longest: String?, shortest: String?) {
        guard !isEmpty else { return (nil, nil) }
        let sorted = self.sorted { $0.count > $1.count }
        return (sorted.first, sorted.last)
    }
}

/**
 Interleave two arrays.
 
 This function interleaves elements from two arrays into a single array.
 
 - parameter other: The array to interleave with.
 - returns: An interleaved array containing elements from both arrays.
 */
extension Array {
    func interleaved(with other: [Element]) -> [Element] {
        var result = [Element]()
        let maxCount = Swift.max(count, other.count)
        for i in 0..<maxCount {
            if i < self.count {
                result.append(self[i])
            }
            if i < other.count {
                result.append(other[i])
            }
        }
        return result
    }
}

/**
 Reverse elements of an array of strings in place.
 
 This function reverses the characters of each element (string) in the array in place.
 */
extension Array where Element == String {
    mutating func reverseStringsInPlace() {
        self = self.map { String($0.reversed()) }
    }
}

/**
 Check if the array contains any elements.
 
 This property checks if the array contains any elements.
 */
extension Array {
    var isNotEmpty: Bool {
        return !isEmpty
    }
}

/**
 Find the last index of an element in the array.
 
 This function finds the last index of a specified element in the array.
 
 - parameter element: The element to find.
 - returns: The last index of the element, or nil if the element is not found.
 */
extension Array where Element: Equatable {
    func lastIndex(of element: Element) -> Int? {
        for index in stride(from: count - 1, through: 0, by: -1) {
            if self[index] == element {
                return index
            }
        }
        return nil
    }
}

/**
 Map elements of the array with their indices.
 
 This function maps each element of the array with its corresponding index.
 
 - parameter transform: A closure that takes an index and an element as its arguments and returns a transformed value.
 - returns: An array containing the transformed elements.
 */
extension Array {
    func mapWithIndex<T>(_ transform: (Int, Element) -> T) -> [T] {
        return enumerated().map { transform($0.offset, $0.element) }
    }
}

/**
 Convert the array to a set.
 
 This function converts the array into a set.
 
 - returns: A set containing unique elements from the array.
 */
extension Array where Element: Hashable {
    func toSet() -> Set<Element> {
        return Set(self)
    }
}

/**
 Join elements of the array into a string with a separator.
 
 This function joins elements of the array into a single string, separated by a specified separator.
 
 - parameter separator: The separator to use between elements.
 - returns: A string containing elements of the array joined by the separator.
 */
extension Array where Element: CustomStringConvertible {
    func joined(separator: String) -> String {
        return map { $0.description }.joined(separator: separator)
    }
}

/**
 Insert an element at a specific position in the array.
 
 This function inserts an element at a specified position in the array.
 
 - parameter element: The element to insert.
 - parameter index: The index at which to insert the element.
 - parameter ifWithinBounds: Optionally specify whether to insert only if the index is within bounds of the array.
 */
extension Array {
    mutating func insert(_ element: Element, at index: Int, ifWithinBounds: Bool = false) {
        if ifWithinBounds {
            if index >= 0 && index <= count {
                insert(element, at: index)
            }
        } else {
            insert(element, at: index)
        }
    }
}

/**
 Safely access a random element from the array.
 
 This property safely accesses a random element from the array.
 */
extension Array {
    var randomElementSafe: Element? {
        return isEmpty ? nil : self[Int.random(in: 0..<count)]
    }
}

/**
 Remove the first element from the array and return it.
 
 This function removes and returns the first element from the array.
 
 - returns: The first element of the array, or nil if the array is empty.
 */
extension Array {
    mutating func popFirst() -> Element? {
        return isEmpty ? nil : removeFirst()
    }
}

/**
 Remove the last element from the array and return it.
 
 This function removes and returns the last element from the array.
 
 - returns: The last element of the array, or nil if the array is empty.
 */
extension Array {
    mutating func popLast() -> Element? {
        return isEmpty ? nil : removeLast()
    }
}

/**
 Remove elements from the beginning of the array.
 
 This function removes the specified number of elements from the beginning of the array.
 
 - parameter n: The number of elements to remove.
 */
extension Array {
    mutating func removeFirst(_ n: Int) {
        guard n > 0 else { return }
        let end = Swift.min(n, count)
        removeFirst(end)
    }
}

/**
 Remove elements from the end of the array.
 
 This function removes the specified number of elements from the end of the array.
 
 - parameter n: The number of elements to remove.
 */
extension Array {
    mutating func removeLast(_ n: Int) {
        guard n > 0 else { return }
        let start = Swift.max(count - n, 0)
        removeSubrange(start ..< count)
    }
}

/**
 Append an optional element to the array, if it is not nil.
 
 This function appends an optional element to the array, but only if the element is not nil.
 
 - parameter element: The optional element to append.
 */
extension Array {
    mutating func appendIfNotNil(_ element: Element?) {
        if let element = element {
            append(element)
        }
    }
}

/**
 Remove all occurrences of a specified element from the array.
 
 This function removes all occurrences of a specified element from the array.
 
 - parameter element: The element to remove from the array.
 */
extension Array where Element: Equatable {
    mutating func removeAll(_ element: Element) {
        self = self.filter { $0 != element }
    }
}

/**
 Remove all elements from the array that satisfy a given predicate.
 
 This function removes all elements from the array that satisfy the given predicate.
 
 - parameter predicate: A closure that takes an element as its argument and returns a Boolean value indicating whether the element should be removed.
 */
extension Array {
    mutating func removeAll(where predicate: (Element) -> Bool) {
        self = self.filter { !predicate($0) }
    }
}
/**
 Check if the array contains all elements from another array.
 
 This function checks if the array contains all elements from another array.
 
 - parameter elements: The array of elements to check for containment.
 - returns: `true` if all elements from `elements` are contained in the array, `false` otherwise.
 */
extension Array where Element: Equatable {
    func containsAll(_ elements: [Element]) -> Bool {
        return elements.allSatisfy(self.contains)
    }
}

/**
 Convert the array to JSON data.
 
 This function converts the array into JSON data.
 
 - parameter options: Options for JSON serialization.
 - returns: Optional JSON data representing the array, or nil if an error occurs during serialization.
 */
extension Array where Element: Encodable {
    func toJsonData(options: JSONSerialization.WritingOptions = []) -> Data? {
        return try? JSONEncoder().encode(self)
    }
}

/**
 Convert the array to a JSON string.
 
 This function converts the array into a JSON string.
 
 - parameter options: Options for JSON serialization.
 - returns: Optional JSON string representing the array, or nil if an error occurs during serialization.
 */
extension Array where Element: Encodable {
    func toJsonString(options: JSONSerialization.WritingOptions = []) -> String? {
        guard let jsonData = self.toJsonData(options: options) else { return nil }
        return String(data: jsonData, encoding: .utf8)
    }
}

/**
 Group elements of the array by a specified key.
 
 This function groups elements of the array into a dictionary of arrays, using a specified key path for grouping.
 
 - parameter keyPath: The key path to use for grouping elements.
 - returns: A dictionary where keys are determined by the specified key path, and values are arrays of elements grouped by those keys.
 */
extension Array {
    func grouped<Key>(by keyPath: KeyPath<Element, Key>) -> [Key: [Element]] where Key: Hashable {
        return Dictionary(grouping: self, by: { $0[keyPath: keyPath] })
    }
}

/**
 Convert the array to a dictionary, using a specified closure to determine keys and values.
 
 This function converts the array into a dictionary, using a closure to determine keys and values.
 
 - parameter transform: A closure that transforms an element of the array into a key-value pair.
 - returns: A dictionary containing elements of the array as key-value pairs.
 */
extension Array {
    func toDictionary<Key, Value>(_ transform: (Element) -> (Key, Value)) -> [Key: Value] {
        var dictionary = [Key: Value]()
        for element in self {
            let (key, value) = transform(element)
            dictionary[key] = value
        }
        return dictionary
    }
}

/**
 Check if all elements in the array are unique.
 
 This function checks if all elements in the array are unique (no duplicates).
 
 - returns: `true` if all elements in the array are unique, `false` otherwise.
 */
extension Array where Element: Hashable {
    func allUnique() -> Bool {
        var set = Set<Element>()
        for element in self {
            if !set.insert(element).inserted {
                return false
            }
        }
        return true
    }
}

/**
 Convert the array to a comma-separated string.
 
 This function converts the array into a comma-separated string.
 
 - returns: A string representation of the array, with elements separated by commas.
 */
extension Array where Element: CustomStringConvertible {
    func joinedWithCommas() -> String {
        return self.joined(separator: ", ")
    }
}

/**
 Perform a binary search to find the index where the specified value should be inserted to maintain order.
 
 This function performs a binary search to find the index where the specified value should be inserted to maintain order.
 
 - parameter value: The value to find the insertion index for.
 - parameter areInIncreasingOrder: A closure that compares two elements of the array and returns `true` if the first element should appear before the second element in the sorted array.
 - returns: The index where the value should be inserted to maintain order.
 */
extension Array {
    func insertionIndex(of value: Element, sortedBy areInIncreasingOrder: (Element, Element) -> Bool) -> Int {
        var low = 0
        var high = count
        while low < high {
            let mid = low + (high - low) / 2
            if areInIncreasingOrder(self[mid], value) {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return low
    }
}

/**
 Split the array into two halves.
 
 This function splits the array into two halves.
 
 - returns: A tuple containing two arrays, each representing one half of the original array.
 */
extension Array {
    func splitIntoTwo() -> ([Element], [Element]) {
        let midIndex = count / 2
        let leftHalf = self[0..<midIndex]
        let rightHalf = self[midIndex..<count]
        return (Array(leftHalf), Array(rightHalf))
    }
}



