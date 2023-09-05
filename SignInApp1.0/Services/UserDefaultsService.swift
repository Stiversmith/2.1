//
//  UserDefaultsService.swift
//  SignInApp1.0
//
//  Created by Aliaksandr Yashchuk on 8/30/23.
//

import Foundation

final class UserDefaultsService {
    
    static func saveUserModel(userModel: UserModel) {
        UserDefaults.standard.set(userModel.email, forKey: UserDefaults.Keys.email.rawValue)
        UserDefaults.standard.set(userModel.pass, forKey: UserDefaults.Keys.password.rawValue)
    }
    
    static func getUserModel() -> UserModel? {
            guard let email = UserDefaults.standard.string(forKey: UserDefaults.Keys.email.rawValue),
                  let pass = UserDefaults.standard.string(forKey: UserDefaults.Keys.password.rawValue) else { return nil }
            let userModel = UserModel(email: email, pass: pass)
            return userModel
        }
    
    static func cleanUserDefailts() {
        UserDefaults.standard.reset()
    }
    
}
