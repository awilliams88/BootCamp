//
//  BootCampTests.swift
//  BootCampTests
//
//  Created by Arpit Williams on 20/09/17.
//  Copyright © 2017 StarKnights. All rights reserved.
//

import XCTest
import Foundation
@testable import BootCamp

class BootCampTests: XCTestCase {
    
    var calendar: Calendar!
    var dayComponent: DateComponents!
    var testDate: Date!
    
    override func setUp() {
        super.setUp()
        calendar = Calendar.current
        dayComponent = DateComponents()
        dayComponent.setValue(2, for: .day)
        testDate = calendar.date(byAdding: dayComponent, to: Date())
    }
    
    override func tearDown() {
        super.tearDown()
        calendar = nil
        dayComponent = nil
        testDate = nil
    }
    
    func testThatSeventhNonWorkingDayIsWeekday() {
        let seventhNonWorkingDay = Utility.dateForSeventhWorkingDay(after: testDate)
        let dayOfWeek = calendar.component(.weekday, from: seventhNonWorkingDay)
        XCTAssertFalse(dayOfWeek == 1 || dayOfWeek == 7, "Failed : Seventh Non Working Day Is Weekend")
    }
    
}
