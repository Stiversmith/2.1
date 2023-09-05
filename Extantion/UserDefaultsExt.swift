//
//  UserDefaultsExt.swift
//  SignInApp1.0
//
//  Created by Aliaksandr Yashchuk on 8/30/23.
//

import Foundation

extension UserDefaults {
    
    enum Keys: String, CaseIterable {
        case email
        case password
    }
    
    func reset() {
        let allCases = Keys.allCases
        allCases.forEach { removeObject(forKey: $0.rawValue) }
    }
}
