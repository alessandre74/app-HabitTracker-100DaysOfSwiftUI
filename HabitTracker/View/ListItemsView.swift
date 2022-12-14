//
//  ListItemsView.swift
//  HabitTracker
//
//  Created by Alessandre Livramento on 05/12/22.
//

import SwiftUI

struct ListItemsView: View {
    var item: Habit

    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title)
                .font(.title3.bold())

            HStack {
                Text(item.description)
                    .font(.caption.bold())
                    .foregroundColor(.secondary)

                Spacer()

                Text(item.habitCount <= 1 ? "\(item.habitCount) time" : "\(item.habitCount) times")
                    .font(.caption.bold())
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .preferredColorScheme(.dark)
    }
}

struct ListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemsView(item: Habit(title: "Habit 1", description: "Description habit 1", habitCount: 0))
            .preferredColorScheme(.dark)
    }
}
