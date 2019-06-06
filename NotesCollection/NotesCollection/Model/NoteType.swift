//
//  NoteType.swift
//  NotesCollection
//
//  Created by Pedro Enrique Sobrosa Lopes on 06/06/19.
//  Copyright © 2019 Pedro. All rights reserved.
//

import Foundation

enum NoteType: CaseIterable {
    case yellow
    case orange
    case green
    case blue
    case pink
    
    var description: String {
        switch self {
        case .yellow:
            return "yellow"
        case .orange:
            return "orange"
        case .green:
            return "green"
        case .blue:
            return "blue"
        case .pink:
            return "pink"
        }
    }
    
    var titleColor: String {
        switch self {
        case .yellow:
            return "yellowTitle"
        case .orange:
            return "orangeTitle"
        case .green:
            return "greenTitle"
        case .blue:
            return "blueTitle"
        case .pink:
            return "pinkTitle"
        }
    }
    
    var bodyColor: String {
        switch self {
        case .yellow:
            return "yellowBody"
        case .orange:
            return "orangeBody"
        case .green:
            return "greenBody"
        case .blue:
            return "blueBody"
        case .pink:
            return "pinkBody"
        }
    }
    
    var tintColor: String {
        switch self {
        case .yellow:
            return "yellowTint"
        case .orange:
            return "orangeTint"
        case .green:
            return "greenTint"
        case .blue:
            return "blueTint"
        case .pink:
            return "pinkTint"
        }
    }
}
