//
//  Theme.swift
//  pruebaJesus
//
//  Created by Jesus Ervin Chapi Suyo on 14/09/24.
//  Copyright © 2024 Jesus Chapi. All rights reserved.
//

import SwiftUI
enum Theme: String, CaseIterable, Identifiable{
    case system = "System"
    case light = "Light"
    case dark = "Dark"
    
    var id : String {rawValue}
    var description: String {
        rawValue
    }
    var colorScheme: ColorScheme? {
        switch self{
        case .system:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}
