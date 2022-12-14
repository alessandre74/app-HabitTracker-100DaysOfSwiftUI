//
//  Enums.swift
//  HabitTracker
//
//  Created by Alessandre Livramento on 08/12/22.
//

import Foundation

enum TypeField: String {
    case Title
    case Description
}

enum TypeButton: String {
    case save
    case close
}

enum TypeIcon: String {
    case add = "plus"
    case trash
    case trashSlash = "trash.slash"
    case save = "checkmark"
    case close = "xmark"
}

enum TypeNumber: Int {
    case maxLength = 36
}

enum TypeCount: String {
    case increment = "plus.circle"
    case decrement = "minus.circle"
}
