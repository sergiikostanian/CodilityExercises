//
//  Lesson1.swift
//  CodilityExercises
//
//  Created by Sergii Kostanian on 6/16/17.
//  Copyright © 2017 Serg. All rights reserved.
//

import XCTest

/// Iterations

class Lesson1: XCTestCase {

//    A binary gap within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N.
//
//    For example, number 9 has binary representation 1001 and contains a binary gap of length 2. The number 529 has binary representation 1000010001 and contains two binary gaps: one of length 4 and one of length 3. The number 20 has binary representation 10100 and contains one binary gap of length 1. The number 15 has binary representation 1111 and has no binary gaps.
//
//    Write a function:
//
//    class Solution { public int solution(int N); }
//
//    that, given a positive integer N, returns the length of its longest binary gap. The function should return 0 if N doesn't contain a binary gap.
//
//    For example, given N = 1041 the function should return 5, because N has binary representation 10000010001 and so its longest binary gap is of length 5.
//
//    Assume that:
//
//    N is an integer within the range [1..2,147,483,647].
//    Complexity:
//
//    expected worst-case time complexity is O(log(N));
//    expected worst-case space complexity is O(1).
    
    func testBinaryGap() {
        XCTAssertEqual(binaryGap(9), 2)
        XCTAssertEqual(binaryGap(529), 4)
        XCTAssertEqual(binaryGap(20), 1)
        XCTAssertEqual(binaryGap(15), 0)
        XCTAssertEqual(binaryGap(1), 0)
    }
    
    public func binaryGap(_ N : Int) -> Int {
        let bits = String(N, radix: 2)
        
        var gapLength = 0
        var bigestGapLength = 0
        
        for bit in bits.characters {
            if bit == "1" {
                bigestGapLength = max(gapLength, bigestGapLength)
                gapLength = 0
            } else { // bit == "0"
                gapLength += 1
            }
        }
        
        return bigestGapLength
    }

}
