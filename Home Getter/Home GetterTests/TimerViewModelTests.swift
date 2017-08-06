//
//  Home_GetterTests.swift
//  Home GetterTests
//
//  Created by nicole ruduss on 06/08/2017.
//  Copyright © 2017 nicole ruduss. All rights reserved.
//

import XCTest
@testable import Home_Getter

class TimerViewModelTests: XCTestCase {
    
    var timerVM: TimerViewModel!
    
    override func setUp() {
        super.setUp()
        self.timerVM = TimerViewModel()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSetTimer_WithValidParams_ShouldSetTimer() {
        // GIVEN
        let timer = Timer(fireAt: Date(), interval: nil, target: <#T##Any#>, selector: <#T##Selector#>, userInfo: <#T##Any?#>, repeats: <#T##Bool#>)
        
        // WHEN
        
        // THEN
    }
    
    func testGetTimer_WithValidParams_ShouldReturnTimer() {
    
    }
    
    func testDeleteTimer_WithValidParams_ShouldDeleteTimer() {
    
    }
    
}
