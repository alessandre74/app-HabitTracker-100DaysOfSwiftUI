//
//  TextFieldView.swift
//  HabitTracker
//
//  Created by Alessandre Livramento on 07/12/22.
//

import SwiftUI

struct TextFieldView: View {
    @ObservedObject var habits: HabitViewModel
    @FocusState var selectedField: TypeField?

    @State var placeHolder: String
    @State var isTapped = false

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            TextField("", text: placeHolder == TypeField.Title.rawValue ? $habits.title : $habits.description) { status in
                if status {
                    withAnimation(.easeIn) {
                        isTapped = true
                    }
                }
            }
            .focused($selectedField, equals: placeHolder == TypeField.Title.rawValue ? .Title : .Description)
            .onChange(of: selectedField) { focus in
                let selectedHabit = placeHolder == TypeField.Title.rawValue ? habits.title : habits.description

                if (focus == nil) && selectedHabit.count == 0 {
                    withAnimation(.easeOut) {
                        isTapped = false
                    }
                }
            }
            .background(
                Text(placeHolder)
                    .scaleEffect(isTapped ? 0.8 : 1)
                    .offset(x: isTapped ? -7 : 0, y: isTapped ? -30 : 0)
                    .foregroundColor(.gray)
                , alignment: .leading
            )
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(habits: HabitViewModel(), placeHolder: TypeField.Title.rawValue)
    }
}
