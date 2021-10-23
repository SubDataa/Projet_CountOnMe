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
        XCTAssertEqual(testCalcul.calcul(enterNumber: ["55", "+", "5"]), 60)
      
    }

}
