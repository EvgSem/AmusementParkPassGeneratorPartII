//
//  File.swift
//  AmusementParkPassGenerator
//
//  Created by Ievgeniia Bondini on 9/23/18.
//  Copyright © 2018 Ievgeniia Bondini. All rights reserved.
//

import Foundation


enum DataError: Error {
    case missingPersonalInfo
    case missingAccess
    case freeChildGuestAgeAboveLimit
    case personalDataNotProvided
    case birthDateMissing
    case firstNameMissing
    case lastNameMissing
    case streetAddressMissing
    case cityMissing
    case stateMissing
    case zipCodeMissing
}
