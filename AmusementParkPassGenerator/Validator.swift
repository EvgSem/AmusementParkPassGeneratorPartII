import Foundation

class Validator {
    
    let validAgeForFreeChild = 5
    
    
    func validateProvidedPersonalInfo (entrantType: EntrantType, prividedInfo: Info?) throws {
        
        let requiredInfo = entrantType.requaredPersonalInfo
        if requiredInfo.count == 0 && prividedInfo == nil {
            return
        }
        
        guard let prividedInfo = prividedInfo else {
            throw DataError.missingPersonalInfo
        }
        
        
        switch entrantType {
        case .guest(type: .freeChild) :
            if requiredInfo.contains(.dateOfBirth) && prividedInfo.dateOfBirth == nil {throw DataError.birthDateMissing}
            if requiredInfo.contains(.dateOfBirth) && prividedInfo.dateOfBirth != nil {
                if !isUnderFive(dateOfBirth: prividedInfo.dateOfBirth!) {
                    throw DataError.freeChildGuestAgeAboveLimit
                }
            }
        case .employee(type: .foodServices), .employee(type: .rideServices), .employee(type: .maintenance), .employee(type: .manager):
                if requiredInfo.contains(.firstName) && prividedInfo.firstName == nil {throw DataError.firstNameMissing}
                if requiredInfo.contains(.lastName) && prividedInfo.lastName == nil {throw DataError.lastNameMissing}
                if requiredInfo.contains(.streetAddress) && prividedInfo.streetAddress == nil {throw DataError.streetAddressMissing}
                if requiredInfo.contains(.city) && prividedInfo.city == nil {throw DataError.cityMissing}
                if requiredInfo.contains(.zip) && prividedInfo.zipCode == nil {throw DataError.zipCodeMissing}
                if requiredInfo.contains(.state) && prividedInfo.state == nil {throw DataError.stateMissing}
                if requiredInfo.contains(.dateOfBirth) && prividedInfo.dateOfBirth == nil {throw DataError.birthDateMissing}
        default: return
        }
    }
    
    func isUnderFive(dateOfBirth: Date) -> Bool {
        let calendar = Calendar.current
        let birthDateComponents = calendar.dateComponents([.year], from: dateOfBirth)
        let currentDateComponents = calendar.dateComponents([.year], from: Date())
        
        if let currentYear = currentDateComponents.year, let birthDateYear = birthDateComponents.year {
            if (currentYear - birthDateYear) <= validAgeForFreeChild {
                return true
            }
        }
        return false
    }

    
}
