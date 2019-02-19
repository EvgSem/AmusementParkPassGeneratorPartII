import Foundation

class Validator {
    
    let validAgeForFreeChild = 5
    let validLengthForZipCode = 6
    let validLengthForName = 15
    let validLengthForStreet = 20
    let validLengthForState = 15
    let validLengthForCity = 15
    let validLengthForVendorCompany = 20
    
    var entrantType: EntrantType
    var providedInfo: Info?
    
    init(entrantType: EntrantType, providedInfo: Info?) {
        self.entrantType = entrantType
        self.providedInfo = providedInfo
    }
    
    
    func validate () throws {
        
        let requiredInfo = entrantType.requaredPersonalInfo
        if requiredInfo.count == 0 && providedInfo == nil {
            return
        }
        
        guard let prividedInfo = providedInfo else {
            throw DataError.missingPersonalInfo
        }
        switch entrantType {
        case .guest(type: .freeChild) :
            try freeChildPassValidation(info: prividedInfo)
        case .guest(type: .seasonPass):
            try seasonPassValidation(info: prividedInfo)
        case .guest(type: .senior):
            try seniorPassValidation(info: prividedInfo)
        case .employee(type: .foodServices), .employee(type: .rideServices), .employee(type: .maintenance), .employee(type: .contract):
            try emplyeePassValidation(info: prividedInfo)
        case .manager:
            try emplyeePassValidation(info: prividedInfo)
        case .vendor:
            try vendorPassValidation(info: prividedInfo)
        default: return
        }
    }
    
    func isUnderAge(_ age: Int, date: Date?) -> Bool {
        guard let date = date else {
            return false
        }
        
        let calendar = Calendar.current
        let birthDateComponents = calendar.dateComponents([.year], from: date)
        let currentDateComponents = calendar.dateComponents([.year], from: Date())
        
        if let currentYear = currentDateComponents.year, let birthDateYear = birthDateComponents.year {
            if (currentYear - birthDateYear) <= age {
                return true
            }
        }
        return false
    }
    
    func isValid(infoName: RequiredPersonalInfo, info: String?) -> Bool {
        let requiredInfo = entrantType.requaredPersonalInfo
        return requiredInfo.contains(infoName) && (info == nil || info == "")
    }
    
    func isLengthValid(info: String?, max: Int) -> Bool {
        if let info = info {
            return info.count > max
        }
        return true
    }
    
    func isZipCodeValid(value: String?) -> Bool {
        if let zipcode = value {
            return !CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: zipcode))
        }
        return true
    }

    
}
