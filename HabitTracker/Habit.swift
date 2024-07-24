//
//  Habit.swift
//  HabitTracker
//
//  Created by Anthony Candelino on 2024-07-19.
//

import SwiftUI
import Foundation

struct Habit: Identifiable, Hashable, Codable {
    var id = UUID()
    var name: String
    var timesCompleted = 0
    var color = "charcoal"
    
    mutating func incrementTimesCompleted() {
        timesCompleted += 1
    }
    
    mutating func decreaseTimesCompleted() {
        if (timesCompleted > 0) { timesCompleted -= 1 }
    }
}
