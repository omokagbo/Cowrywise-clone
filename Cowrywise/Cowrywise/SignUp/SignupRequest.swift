//
//  SignupModel.swift
//  Cowrywise
//
//  Created by omokagbo on 10/05/2021.
//

import Foundation

// MARK: - SignupRequest

struct SignupRequest: Codable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    let phoneNumber: String
}
