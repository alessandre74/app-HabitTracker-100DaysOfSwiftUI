//
//  AddNew.swift
//  HabitTracker
//
//  Created by Alessandre Livramento on 06/12/22.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var habits: HabitViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        TextFieldView(habits: habits, placeHolder: TypeField.Title.rawValue)
                    }
                }

                Section {
                    HStack {
                        TextFieldView(habits: habits, placeHolder: TypeField.Description.rawValue)
                        Text("\(habits.description.count)/\(TypeNumber.maxLength.rawValue)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("New habit")
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        if !habits.isValidFields() {
                            habits.isValidField = true
                        } else {
                            habits.save()
                            dismiss()
                        }

                    } label: {
                        Image(systemName: TypeIcon.save.rawValue)
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        habits.reset()
                        dismiss()

                    } label: {
                        Image(systemName: TypeIcon.close.rawValue)
                            .foregroundColor(.red)
                    }
                }
            }
            .alert("Warning", isPresented: $habits.isValidField) {
                Button("Ok", role: .cancel) {}
            } message: {
                Text("Required fields!")
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habits: HabitViewModel())
    }
}
