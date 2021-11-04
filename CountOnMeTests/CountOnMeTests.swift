//
//  CountOnMeTests.swift
//  CountOnMeTests
//
//  Created by Thibault Ballof on 23/10/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CountOnMeTests: XCTestCase {

    let testCalcul = Calculator()
    
    func testAddition() {
        testCalcul.enterNumber = ["55", "+", "5"]
        XCTAssertEqual(testCalcul.calcul(), 60)
        
    }
    func testSubstraction() {
        testCalcul.enterNumber = ["55", "-", "5"]
        XCTAssertEqual(testCalcul.calcul(), 50)
    }
    func testMultiplication() {
        testCalcul.enterNumber = ["5", "*", "5"]
        XCTAssertEqual(testCalcul.calcul(), 25)
        testCalcul.enterNumber = ["2", "+", "5", "*", "2"]
        XCTAssertEqual(testCalcul.calcul(), 12)
    }
    func testDivision() {
        testCalcul.enterNumber = ["50", "/", "5"]
        XCTAssertEqual(testCalcul.calcul(), 10)
        testCalcul.enterNumber = ["10", "+", "50", "/", "5"]
        XCTAssertEqual(testCalcul.calcul(), 20)
    }
    
    func testDivisionByZero() {
        testCalcul.enterNumber = ["55", "/", "0"]
        XCTAssertFalse(testCalcul.shouldDivide())
        testCalcul.enterNumber = ["55", "/", "5"]
        XCTAssertTrue(testCalcul.shouldDivide())
        
    }
    func testExpressionIsCorrect() {
        testCalcul.enterNumber = ["55", "+", "+"]
        XCTAssertFalse(testCalcul.expressionIsCorrect)
        testCalcul.enterNumber = ["55", "+", "5"]
        XCTAssertTrue(testCalcul.expressionIsCorrect)
    }
    
    func testExpressionHaveEnoughElement() {
        testCalcul.enterNumber = ["55", "+"]
        XCTAssertFalse(testCalcul.expressionHaveEnoughElement)
        testCalcul.enterNumber = ["55", "+", "5"]
        XCTAssertTrue(testCalcul.expressionHaveEnoughElement)
    }
    

    func testCanAddOperator() {
        testCalcul.enterNumber = ["55", "+", "+"]
        XCTAssertFalse(testCalcul.canAddOperator)
        testCalcul.enterNumber = ["55", "+", "5"]
        XCTAssertTrue(testCalcul.canAddOperator)
    }
    
    func testClear() {
        testCalcul.enterNumber = ["55", "+", "6"]
        testCalcul.clear()
        XCTAssertEqual(testCalcul.enterNumber, [])
    }
}
