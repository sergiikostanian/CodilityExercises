//
//  Lessons.swift
//  CodilityExercises
//
//  Created by Sergii Kostanian on 6/16/17.
//  Copyright © 2017 Serg. All rights reserved.
//

import XCTest

/// Arrays

class Lesson2: XCTestCase {

//    A non-empty zero-indexed array A consisting of N integers is given. The array contains an odd number of elements, and each element of the array can be paired with another element that has the same value, except for one element that is left unpaired.
//
//    For example, in array A such that:
//
//    A[0] = 9  A[1] = 3  A[2] = 9
//    A[3] = 3  A[4] = 9  A[5] = 7
//    A[6] = 9
//    the elements at indexes 0 and 2 have value 9,
//    the elements at indexes 1 and 3 have value 3,
//    the elements at indexes 4 and 6 have value 9,
//    the element at index 5 has value 7 and is unpaired.
//    Write a function:
//
//    int solution(int A[], int N);
//    that, given an array A consisting of N integers fulfilling the above conditions, returns the value of the unpaired element.
//
//    For example, given array A such that:
//
//    A[0] = 9  A[1] = 3  A[2] = 9
//    A[3] = 3  A[4] = 9  A[5] = 7
//    A[6] = 9
//    the function should return 7, as explained in the example above.
    
    func testOddOccurrencesInArray() {
        let arr1: [Int] = [9, 3, 9, 3, 9, 7, 9]
        XCTAssertEqual(oddOccurrencesInArray(from: arr1), 7)
    }
    
    func oddOccurrencesInArray(from A: [Int]) -> Int {
        var setA: Set<Int> = []
        
        for element in A {
            if setA.contains(element) {
                setA.remove(element)
            } else {
                setA.insert(element)
            }
        }
        
        return setA.first ?? 0
    }
    
    
    
    
    
    
    
    
    
    
    
//    A zero-indexed array A consisting of N integers is given. Rotation of the array means that each element is shifted right by one index, and the last element of the array is also moved to the first place.
//
//    For example, the rotation of array A = [3, 8, 9, 7, 6] is [6, 3, 8, 9, 7]. The goal is to rotate array A K times; that is, each element of A will be shifted to the right by K indexes.
//
//    Write a function:
//
//    public func solution(_ A : inout [Int], _ K : Int) -> [Int]
//    that, given a zero-indexed array A consisting of N integers and an integer K, returns the array A rotated K times.
//
//    For example, given array A = [3, 8, 9, 7, 6] and K = 3, the function should return [9, 7, 6, 3, 8].
//
//    Assume that:
//
//    N and K are integers within the range [0..100];
//    each element of array A is an integer within the range [−1,000..1,000].
    
    func testCyclicRotation() {
        XCTAssertEqual(cyclicRotation([3, 8, 9, 7, 6], 8), [9, 7, 6, 3, 8])
        XCTAssertEqual(cyclicRotation([5, -1000], 3),  [-1000, 5])
        XCTAssertEqual(cyclicRotation([5, -1], 2),  [5, -1])
    }
    
    func cyclicRotation(_ A: [Int], _ K: Int) -> [Int] {
        if A.count == 0 {
            return []
        }
        
        let rotationsCount = K % A.count
        
        if A.count == 1 || rotationsCount == 0 {
            return A
        }
        
        return Array(A.suffix(rotationsCount) + A.prefix(A.count - rotationsCount))
    }

}
