//
//  LoginModel.swift
//  Cowrywise
//
//  Created by omokagbo on 10/05/2021.
//

import Foundation

// MARK: - LoginRequest
struct LoginRequest: Codable {
    let email: String
    let password: String
}
