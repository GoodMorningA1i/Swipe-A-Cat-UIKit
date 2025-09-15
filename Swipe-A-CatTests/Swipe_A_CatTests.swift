//
//  Swipe_A_CatTests.swift
//  Swipe-A-CatTests
//
//  Created by Ali Syed on 2025-09-14.
//

import Testing
@testable import Swipe_A_Cat

struct Swipe_A_CatTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
    
    @Test("divide numbers that evenly go into each other")
    func testDivideEvenly() {
        let x = 6
        let y = 2
        #expect(ViewController().divide(x, y) == 3)
    }
    
    @Test("divide numbers that will produce a remainder")
    func testDivideWithRemainder() {
        let x = 5
        let y = 2
        #expect(ViewController().divide(x, y) == 2)
    }
    
    @Test("divide by zero")
    func testDivideByZero() {
        let x = 5
        let y = 0
        #expect(ViewController().divide(x, y) == 0)
    }

}
