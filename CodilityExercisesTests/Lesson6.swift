//
//  Lesson6.swift
//  CodilityExercises
//
//  Created by Sergii Kostanian on 6/26/17.
//  Copyright © 2017 Serg. All rights reserved.
//

import XCTest

class Lesson6: XCTestCase {

//    Write a function
//    
//    public func solution(_ A : inout [Int]) -> Int
//    
//    that, given a zero-indexed array A consisting of N integers, returns the number of distinct values in array A.
//    
//    Assume that:
//    
//    N is an integer within the range [0..100,000];
//    each element of array A is an integer within the range [−1,000,000..1,000,000].
//    For example, given array A consisting of six elements such that:
//    
//    A[0] = 2    A[1] = 1    A[2] = 1
//    A[3] = 2    A[4] = 3    A[5] = 1
//    the function should return 3, because there are 3 distinct values appearing in array A, namely 1, 2 and 3.
//    
//    Complexity:
//    
//    expected worst-case time complexity is O(N*log(N));
//    expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
//    Elements of input arrays can be modified.

    func testDistinct() {
        XCTAssertEqual(distinct([2, 1, 1, 2, 3, 1]), 3)
    }

    public func distinct(_ A: [Int]) -> Int {
        return Set(A).count
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    A non-empty zero-indexed array A consisting of N integers is given. The product of triplet (P, Q, R) equates to A[P] * A[Q] * A[R] (0 ≤ P < Q < R < N).
//    
//    For example, array A such that:
//    
//    A[0] = -3
//    A[1] = 1
//    A[2] = 2
//    A[3] = -2
//    A[4] = 5
//    A[5] = 6
//    contains the following example triplets:
//    
//    (0, 1, 2), product is −3 * 1 * 2 = −6
//    (1, 2, 4), product is 1 * 2 * 5 = 10
//    (2, 4, 5), product is 2 * 5 * 6 = 60
//    Your goal is to find the maximal product of any triplet.
//    
//    Write a function:
//    
//    public func solution(_ A : inout [Int]) -> Int
//    that, given a non-empty zero-indexed array A, returns the value of the maximal product of any triplet.
//    
//    For example, given array A such that:
//    
//    A[0] = -3
//    A[1] = 1
//    A[2] = 2
//    A[3] = -2
//    A[4] = 5
//    A[5] = 6
//    the function should return 60, as the product of triplet (2, 4, 5) is maximal.
//    
//    Assume that:
//    
//    N is an integer within the range [3..100,000];
//    each element of array A is an integer within the range [−1,000..1,000].
//    Complexity:
//    
//    expected worst-case time complexity is O(N*log(N));
//    expected worst-case space complexity is O(1), beyond input storage (not counting the storage required for input arguments).
//    Elements of input arrays can be modified.

    func testMaxProductOfThree() {
        XCTAssertEqual(maxProductOfThree([-3, 1, 2, -2, 5, 6]), 60)
    }
    
    func maxProductOfThree(_ A: [Int]) -> Int {
        let sortedA = A.sorted()
        let count = sortedA.count
        let fisrtTwoAndLastOne = sortedA[0] * sortedA[1] * sortedA[count - 1]
        let lastThree = sortedA[count - 1] * sortedA[count - 2] * sortedA[count - 3]
        return max(fisrtTwoAndLastOne, lastThree)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 
    
//    A zero-indexed array A consisting of N integers is given. A triplet (P, Q, R) is triangular if 0 ≤ P < Q < R < N and:
//    
//    A[P] + A[Q] > A[R],
//    A[Q] + A[R] > A[P],
//    A[R] + A[P] > A[Q].
//    For example, consider array A such that:
//    
//    A[0] = 10    A[1] = 2    A[2] = 5
//    A[3] = 1     A[4] = 8    A[5] = 20
//    Triplet (0, 2, 4) is triangular.
//    
//    Write a function:
//    
//    public func solution(_ A : inout [Int]) -> Int
//    that, given a zero-indexed array A consisting of N integers, returns 1 if there exists a triangular triplet for this array and returns 0 otherwise.
//    
//    For example, given array A such that:
//    
//    A[0] = 10    A[1] = 2    A[2] = 5
//    A[3] = 1     A[4] = 8    A[5] = 20
//    the function should return 1, as explained above. Given array A such that:
//    
//    A[0] = 10    A[1] = 50    A[2] = 5
//    A[3] = 1
//    the function should return 0.
//    
//    Assume that:
//    
//    N is an integer within the range [0..100,000];
//    each element of array A is an integer within the range [−2,147,483,648..2,147,483,647].
//    Complexity:
//    
//    expected worst-case time complexity is O(N*log(N));
//    expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
//    Elements of input arrays can be modified.

    func testTriangle() {
        XCTAssertEqual(triangle([10, 2, 5, 1, 8, 20]), 1)
        XCTAssertEqual(triangle([10, 50, 5, 1]), 0)
        XCTAssertEqual(triangle([5, 3, 3]), 1)
        XCTAssertEqual(triangle([1, 1, 1, 1, 5, 5, 5]), 1)
    }
    
    func triangle(_ A: [Int]) -> Int {
        
        if A.count < 3 {
            return 0
        }

        let sortedA = A.sorted()

        for i in 0..<sortedA.count - 2 {
            if isTriangular(sortedA[i], sortedA[i + 1], sortedA[i + 2]) == 1 {
                return 1
            }
        }
        
        return 0
    }
    
    func isTriangular(_ P: Int, _ Q: Int, _ R: Int) -> Int {
        if  P + Q > R &&
            Q + R > P &&
            R + P > Q {
            return 1
        }
        return 0
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    We draw N discs on a plane. The discs are numbered from 0 to N − 1. A zero-indexed array A of N non-negative integers, specifying the radiuses of the discs, is given. The J-th disc is drawn with its center at (J, 0) and radius A[J].
//    
//    We say that the J-th disc and K-th disc intersect if J ≠ K and the J-th and K-th discs have at least one common point (assuming that the discs contain their borders).
//    
//    The figure below shows discs drawn for N = 6 and A as follows:
//    
//    A[0] = 1
//    A[1] = 5
//    A[2] = 2
//    A[3] = 1
//    A[4] = 4
//    A[5] = 0
//    
//    
//    There are eleven (unordered) pairs of discs that intersect, namely:
//    
//    discs 1 and 4 intersect, and both intersect with all the other discs;
//    disc 2 also intersects with discs 0 and 3.
//    Write a function:
//    
//    public func solution(_ A : inout [Int]) -> Int
//    that, given an array A describing N discs as explained above, returns the number of (unordered) pairs of intersecting discs. The function should return −1 if the number of intersecting pairs exceeds 10,000,000.
//    
//    Given array A shown above, the function should return 11, as explained above.
//    
//    Assume that:
//    
//    N is an integer within the range [0..100,000];
//    each element of array A is an integer within the range [0..2,147,483,647].
//    Complexity:
//    
//    expected worst-case time complexity is O(N*log(N));
//    expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
//    Elements of input arrays can be modified.

    func testNumberOfDiscIntersections() {
        XCTAssertEqual(numberOfDiscIntersection([1, 5, 2, 1, 4, 0]), 11)
        XCTAssertEqual(numberOfDiscIntersection([1, 1, 1]), 3)
    }
    
    func numberOfDiscIntersection(_ A: [Int]) -> Int {
        
        var minPointsCount = Array(repeating: 0, count: A.count)
        var maxPointsCount = Array(repeating: 0, count: A.count)
        
        for i in 0..<A.count {
            minPointsCount[max(0, i - A[i])] += 1
            
            if i < (A.count - A[i]) {
                maxPointsCount[i + A[i]] += 1
            }
        }
        
        var pairsCount = 0
        var discsInFocuse = 0
        
        for i in 0..<A.count {
            if minPointsCount[i] > 0 {
                pairsCount += discsInFocuse * minPointsCount[i]
                
                let pairsCountOfMinPoints = (minPointsCount[i] * (minPointsCount[i] - 1)) / 2
                pairsCount += pairsCountOfMinPoints
                
                if pairsCount > 10_000_000 {
                    return -1
                }

                discsInFocuse += minPointsCount[i]
            }
            discsInFocuse -= maxPointsCount[i]
        }

        return pairsCount
    }
}
