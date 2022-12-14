//
//  ContentView.swift
//  HabitTracker
//
//  Created by Alessandre Livramento on 05/12/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habits = HabitViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(habits.items) { item in
                    NavigationLink {
                        DetailView(habits: habits, habit: item)
                    } label: {
                        ListItemsView(item: item)
                    }
                }
                .onDelete(perform: habits.removeItem)
            }
            .navigationTitle("Habits")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        habits.isAdd = true
                    } label: {
                        Image(systemName: TypeIcon.add.rawValue)
                            .foregroundColor(.blue)
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if !habits.isEmpty() {
                            withAnimation {
                                habits.isEditing.toggle()
                            }
                        }

                    } label: {
                        Image(systemName: habits.isEditing ? TypeIcon.trashSlash.rawValue : TypeIcon.trash.rawValue)
                            .foregroundColor(habits.isEditing ?.red : .blue)
                    }
                    .disabled(habits.isEmpty())
                }
            }
            .environment(\.editMode, .constant(habits.isEditing ? EditMode.active : EditMode.inactive))
        }
        .preferredColorScheme(.dark)
        .sheet(isPresented: $habits.isAdd) {
            AddView(habits: habits)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
