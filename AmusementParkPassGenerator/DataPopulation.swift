//
//  DataPopulation.swift
//  AmusementParkPassGenerator
//
//  Created by Ievgeniia Bondini on 2/3/19.
//  Copyright © 2019 Ievgeniia Bondini. All rights reserved.
//

import Foundation


class DataPopulation {
    var entrantType: EntrantType
    
    init(entrantType: EntrantType){
        self.entrantType = entrantType
    }
    
    func populate() -> Info {
        var personalInfo = Info()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yy"
        var date = formatter.date(from: "08/10/16")
        
        switch entrantType {
    
        case .guest(type: .freeChild) :
            personalInfo.dateOfBirth = date
        case .guest(type: .seasonPass):
            personalInfo.firstName = "Max"
            personalInfo.lastName = "Pecu"
            personalInfo.streetAddress = "River Oaks Street"
            personalInfo.zipCode = "95135"
            personalInfo.city = "San Jose"
            personalInfo.state = "California"
        case .guest(type: .senior) :
            personalInfo.firstName = "Max"
            personalInfo.lastName = "Pecu"
            date = formatter.date(from: "08/10/56")
            personalInfo.dateOfBirth = date
    case .employee(type: .foodServices), .employee(type: .rideServices), .employee(type: .maintenance):
            personalInfo.firstName = "Max"
            personalInfo.lastName = "Pecu"
            personalInfo.streetAddress = "River Oaks Street"
            personalInfo.zipCode = "95135"
            personalInfo.city = "San Jose"
            personalInfo.state = "California"
        case .manager:
            personalInfo.firstName = "Max"
            personalInfo.lastName = "Pecu"
            personalInfo.streetAddress = "River Oaks Street"
            personalInfo.zipCode = "95135"
            personalInfo.city = "San Jose"
            personalInfo.state = "California"
    case .contract:
        personalInfo.firstName = "Max"
        personalInfo.lastName = "Pecu"
        personalInfo.streetAddress = "River Oaks Street"
        personalInfo.zipCode = "95135"
        personalInfo.city = "San Jose"
        personalInfo.state = "California"
        personalInfo.ssn = "333-55-4444"
        personalInfo.projectNumber = ProjectNumber._1001.rawValue
    case .vendor:
        personalInfo.firstName = "Max"
        personalInfo.lastName = "Pecu"
        personalInfo.vendorCompany = VendorCompany.acme.rawValue
        date = formatter.date(from: "08/10/95")
        personalInfo.dateOfBirth = date
        personalInfo.dateOfVisit = Date()
    default: return personalInfo
    }
        return personalInfo
    }
}
