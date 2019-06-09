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
            return "YellowDark"
        case .orange:
            return "OrangeDark"
        case .green:
            return "GreenDark"
        case .blue:
            return "BlueDark"
        case .pink:
            return "PinkDark"
        }
    }
    
    var bodyColor: String {
        switch self {
        case .yellow:
            return "YellowLight"
        case .orange:
            return "OrangeLight"
        case .green:
            return "GreenLight"
        case .blue:
            return "BlueLight"
        case .pink:
            return "PinkLight"
        }
    }
}
