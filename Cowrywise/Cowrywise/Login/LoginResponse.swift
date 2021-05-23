//
//  LoginResponse.swift
//  Cowrywise
//
//  Created by omokagbo on 11/05/2021.
//

import Foundation

struct LoginResponse: Codable {
    let id: String
    let email: String
    let password: String
}
