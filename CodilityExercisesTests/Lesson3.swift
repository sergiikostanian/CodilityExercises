//
//  Lesson3.swift
//  CodilityExercises
//
//  Created by Sergii Kostanian on 6/16/17.
//  Copyright © 2017 Serg. All rights reserved.
//

import XCTest

/// Time Complexity

class Lesson3: XCTestCase {
    
//    A zero-indexed array A consisting of N different integers is given. The array contains integers in the range [1..(N + 1)], which means that exactly one element is missing.
//
//    Your goal is to find that missing element.
//
//    Write a function:
//
//    public func solution(_ A : inout [Int]) -> Int
//    that, given a zero-indexed array A, returns the value of the missing element.
//
//    For example, given array A such that:
//
//    A[0] = 2
//    A[1] = 3
//    A[2] = 1
//    A[3] = 5
//    the function should return 4, as it is the missing element.
//
//    Assume that:
//
//    N is an integer within the range [0..100,000];
//    the elements of A are all distinct;
//    each element of array A is an integer within the range [1..(N + 1)].
//    Complexity:
//
//    expected worst-case time complexity is O(N);
//    expected worst-case space complexity is O(1), beyond input storage (not counting the storage required for input arguments).
//    Elements of input arrays can be modified.
    
    func testPermMissingElem() {
        XCTAssertEqual(permMissingElem([2, 3, 1, 5]), 4)
    }
    
    func permMissingElem(_ A: [Int]) -> Int {
        if A.count == 0 {
            return 0
        }
        
        let sortedA = A.sorted()
        
        for i in 0..<A.count {
            if sortedA[i + 1] - sortedA[i] > 1 {
                return sortedA[i] + 1
            }
        }
        return 0
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    A small frog wants to get to the other side of the road. The frog is currently located at position X and wants to get to a position greater than or equal to Y. The small frog always jumps a fixed distance, D.
//
//    Count the minimal number of jumps that the small frog must perform to reach its target.
//
//    Write a function:
//
//    public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int
//    that, given three integers X, Y and D, returns the minimal number of jumps from position X to a position equal to or greater than Y.
//
//    For example, given:
//
//    X = 10
//    Y = 85
//    D = 30
//    the function should return 3, because the frog will be positioned as follows:
//
//    after the first jump, at position 10 + 30 = 40
//    after the second jump, at position 10 + 30 + 30 = 70
//    after the third jump, at position 10 + 30 + 30 + 30 = 100
//    Assume that:
//
//    X, Y and D are integers within the range [1..1,000,000,000];
//    X ≤ Y.
//    Complexity:
//
//    expected worst-case time complexity is O(1);
//    expected worst-case space complexity is O(1).
    
    func testFrogJmp() {
        XCTAssertEqual(frogJmp(10, 85, 30), 3)
        XCTAssertEqual(frogJmp(10, 101, 30), 4)
    }
    
    func frogJmp(_ X : Int, _ Y : Int, _ D : Int) -> Int {
        return Int(ceil(Double(Y - X) / Double(D)))
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    A non-empty zero-indexed array A consisting of N integers is given. Array A represents numbers on a tape.
//
//    Any integer P, such that 0 < P < N, splits this tape into two non-empty parts: A[0], A[1], ..., A[P − 1] and A[P], A[P + 1], ..., A[N − 1].
//
//    The difference between the two parts is the value of: |(A[0] + A[1] + ... + A[P − 1]) − (A[P] + A[P + 1] + ... + A[N − 1])|
//
//    In other words, it is the absolute difference between the sum of the first part and the sum of the second part.
//
//    For example, consider array A such that:
//
//    A[0] = 3
//    A[1] = 1
//    A[2] = 2
//    A[3] = 4
//    A[4] = 3
//    We can split this tape in four places:
//
//    P = 1, difference = |3 − 10| = 7
//    P = 2, difference = |4 − 9| = 5
//    P = 3, difference = |6 − 7| = 1
//    P = 4, difference = |10 − 3| = 7
//    Write a function:
//
//    public func solution(_ A : inout [Int]) -> Int
//    that, given a non-empty zero-indexed array A of N integers, returns the minimal difference that can be achieved.
//
//    Assume that:
//
//    N is an integer within the range [2..100,000];
//    each element of array A is an integer within the range [−1,000..1,000].
//    Complexity:
//
//    expected worst-case time complexity is O(N);
//    expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
//    Elements of input arrays can be modified.
    
    func testTapeEquilibrium() {
        XCTAssertEqual(tapeEquilibrium([3, 1, 2, 4, 3]), 1)
    }
    
    func tapeEquilibrium(_ A: [Int]) -> Int {
        var left = A.prefix(1).reduce(0, +)
        var right = A.suffix(A.count - 1).reduce(0, +)
        var minDiff = abs(left - right)
        
        for i in 1..<A.count - 1 {
            left += A[i]
            right -= A[i]
            minDiff = min(minDiff, abs(left - right))
        }
        return minDiff
    }
    
}
