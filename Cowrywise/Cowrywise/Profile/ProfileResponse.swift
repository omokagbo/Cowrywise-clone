//
//  ProfileModel.swift
//  Cowrywise
//
//  Created by omokagbo on 11/05/2021.
//

import Foundation

struct ProfileResponse: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let userName: String
    let gender: Bool
    let dateOfBirth: String
    let nextOfKin: String
    let postalAddress: String
    let email: String
    let phoneNumber: String
}
