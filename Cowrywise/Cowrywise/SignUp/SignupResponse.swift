//
//  SignupResponse.swift
//  Cowrywise
//
//  Created by Decagon on 11/05/2021.
//

import Foundation

// MARK: - SignupResponse

struct SignupResponse: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    let phoneNumber: String
}
