//
//  Habits.swift
//  HabitTracker
//
//  Created by Anthony Candelino on 2024-07-19.
//

import Foundation
import Observation

@Observable
class Habits {
    var habits = [Habit]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedHabits) {
                habits = decodedItems
                return
            }
        }
        
        habits = []
    }
    
    func addHabit(_ habit: Habit) {
        habits.append(habit)
    }
    
    func deleteHabit(id: UUID) {
        habits.removeAll { $0.id == id }
    }
}
