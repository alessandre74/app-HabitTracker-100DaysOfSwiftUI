//
//  Habit.swift
//  HabitTracker
//
//  Created by Alessandre Livramento on 05/12/22.
//

import Foundation

struct Habit: Equatable, Identifiable, Codable {
    var id = UUID()
    let title: String
    let description: String
    var habitCount: Int = 0
}
