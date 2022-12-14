//
//  DetailView.swift
//  HabitTracker
//
//  Created by Alessandre Livramento on 05/12/22.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var habits: HabitViewModel

    var habit: Habit

    var body: some View {
        List {
            Section("Title") {
                Text(habit.title)
                    .font(.footnote)
            }
            // .textCase(nil) // altera o estilo do título da section

            Section("Description") {
                Text(habit.description)
                    .font(.footnote)
            }
            // .textCase(nil) // altera o estilo do título da section

            Section("Completion of Habits") {
                Stepper {
                    Text(habit.habitCount <= 1 ? "\(habit.habitCount) time" : "\(habit.habitCount) times")
                        .font(.footnote.bold())
                } onIncrement: {
                    habits.habitCountIncrement(habit: habit)
                } onDecrement: {
                    habits.habitCountDecrement(habit: habit)
                }
            }
            // .textCase(nil) // altera o estilo do título da section
        }
        .navigationTitle("Habit Details")
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(.dark)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(habits: HabitViewModel(), habit: Habit(title: "Habit 1", description: "Description habit 1", habitCount: 2))
            .preferredColorScheme(.dark)
    }
}
