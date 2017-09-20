//
//  Utility.swift
//  BootCamp
//
//  Created by Arpit Williams on 20/09/17.
//  Copyright © 2017 StarKnights. All rights reserved.
//

import Foundation

class Utility {
    
    class func dateForSeventhWorkingDay(after date: Date) -> Date {
        let calendar = Calendar.current
        
        var dayComponent = DateComponents()
        dayComponent.setValue(7, for: .day)
        
        var startDate = calendar.startOfDay(for: date)
        var endDate = calendar.date(byAdding: dayComponent, to: date) // Add seven days to date
        
        // Check for number of non working days between start and end date
        var nonWorkingDaysCount = 0
        var isNonWorkingDay = false
        
        while startDate <= endDate! || isNonWorkingDay {
            var day = calendar.component(.weekday, from: startDate)
            if day == 1 || day == 7 {
                nonWorkingDaysCount += 1
            }
            
            // Increment start date and check if it's a non working day
            startDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
            day = calendar.component(.weekday, from: startDate)
            if day == 1 || day == 7 {
                isNonWorkingDay = true
            } else {
                isNonWorkingDay = false
            }
        }
        
        // Add non working days to end date to get seventh working day
        dayComponent.setValue(nonWorkingDaysCount, for: .day)
        endDate = calendar.date(byAdding: dayComponent, to: endDate!)
        
        return endDate!
    }
}
