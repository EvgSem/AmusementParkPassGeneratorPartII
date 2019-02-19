import Foundation

extension Validator {
    
    func seasonPassValidation(info: Info?) throws {
        guard let providedInfo = info else {
            return
        }
        if isValid(infoName: .lastName, info: providedInfo.lastName) {
            throw DataError.lastNameMissing
        }
        if isLengthValid(info: providedInfo.lastName, max: validLengthForName) {
            throw DataError.lastNameTooLong
        }
        if isValid(infoName: .firstName, info: providedInfo.firstName) {
            throw DataError.firstNameMissing
        }
        if isLengthValid(info: providedInfo.firstName, max: validLengthForName) {
            throw DataError.firstNameTooLong
        }
        if isValid(infoName: .streetAddress, info: providedInfo.streetAddress){
            throw DataError.streetAddressMissing
        }
        if isLengthValid(info: providedInfo.streetAddress, max: validLengthForStreet) {
            throw DataError.streetTooLong
        }
        if isValid(infoName: .city, info: providedInfo.city) {
            throw DataError.cityMissing
        }
        if isLengthValid(info: providedInfo.city, max: validLengthForCity) {
            throw DataError.cityTooLong
        }
        if isValid(infoName: .zip, info: providedInfo.zipCode){
            throw DataError.zipCodeMissing
        }
        if isLengthValid(info: providedInfo.zipCode, max: validLengthForZipCode) {
            throw DataError.zipCodeTooLong
        }
        if isZipCodeValid(value: providedInfo.zipCode) {
            throw DataError.zipCodeMustHaveNumbersOnly
        }
        if isLengthValid(info: providedInfo.zipCode, max: validLengthForZipCode) {
            throw DataError.zipCodeTooLong
        }
        if isValid(infoName: .state, info: providedInfo.state){
            throw DataError.stateMissing
        }
        if isLengthValid(info: providedInfo.state, max: validLengthForState) {
            throw DataError.stateTooLong
        }
    }
    
    
    func seniorPassValidation(info: Info?) throws {
        guard let providedInfo = info else {
            return
        }
        if isValid(infoName: .lastName, info: providedInfo.lastName) {
            throw DataError.lastNameMissing
        }
        if isLengthValid(info: providedInfo.lastName, max: validLengthForName) {
            throw DataError.lastNameTooLong
        }
        if isValid(infoName: .firstName, info: providedInfo.firstName) {
            throw DataError.firstNameMissing
        }
        if isLengthValid(info: providedInfo.firstName, max: validLengthForName) {
            throw DataError.firstNameTooLong
        }
        if isValid(infoName: .dateOfBirth, info: dateToString(date: providedInfo.dateOfBirth)) {
            throw DataError.birthDateMissing
        }
    }
    
    func freeChildPassValidation(info: Info?) throws {
        guard let providedInfo = info else {
            return
        }
        
        if isValid(infoName: .dateOfBirth, info: dateToString(date: providedInfo.dateOfBirth)) {
            throw DataError.birthDateMissing
        }
        if !isUnderAge(validAgeForFreeChild, date: providedInfo.dateOfBirth) {
            throw DataError.freeChildGuestAgeAboveLimit
        }
    }
    
    func emplyeePassValidation(info: Info?) throws {
        guard let providedInfo = info else {
            return
        }
        if isValid(infoName: .lastName, info: providedInfo.lastName) {
            throw DataError.lastNameMissing
        }
        if isLengthValid(info: providedInfo.lastName, max: validLengthForName) {
            throw DataError.lastNameTooLong
        }
        if isValid(infoName: .firstName, info: providedInfo.firstName) {
            throw DataError.firstNameMissing
        }
        if isLengthValid(info: providedInfo.firstName, max: validLengthForName) {
            throw DataError.firstNameTooLong
        }
        if isValid(infoName: .streetAddress, info: providedInfo.streetAddress){
            throw DataError.streetAddressMissing
        }
        if isLengthValid(info: providedInfo.streetAddress, max: validLengthForStreet) {
            throw DataError.streetTooLong
        }
        if isValid(infoName: .city, info: providedInfo.city) {
            throw DataError.cityMissing
        }
        if isLengthValid(info: providedInfo.city, max: validLengthForCity) {
            throw DataError.cityTooLong
        }
        if isValid(infoName: .zip, info: providedInfo.zipCode){
            throw DataError.zipCodeMissing
        }
        if isLengthValid(info: providedInfo.zipCode, max: validLengthForZipCode) {
            throw DataError.zipCodeTooLong
        }
        if isZipCodeValid(value: providedInfo.zipCode) {
            throw DataError.zipCodeMustHaveNumbersOnly
        }
        if isLengthValid(info: providedInfo.zipCode, max: validLengthForZipCode) {
            throw DataError.zipCodeTooLong
        }
        if isValid(infoName: .state, info: providedInfo.state){
            throw DataError.stateMissing
        }
        if isLengthValid(info: providedInfo.state, max: validLengthForState) {
            throw DataError.stateTooLong
        }
    }
    
    func vendorPassValidation(info: Info?) throws {
        guard let providedInfo = info else {
            return
        }
        if isValid(infoName: .lastName, info: providedInfo.lastName) {
            throw DataError.lastNameMissing
        }
        if isLengthValid(info: providedInfo.lastName, max: validLengthForName) {
            throw DataError.lastNameTooLong
        }
        if isValid(infoName: .firstName, info: providedInfo.firstName) {
            throw DataError.firstNameMissing
        }
        if isLengthValid(info: providedInfo.firstName, max: validLengthForName) {
            throw DataError.firstNameTooLong
        }
        
        if isValid(infoName: .vendorCompany, info: providedInfo.vendorCompany) {
            throw DataError.vendorCompanyMissing
        }
        if isLengthValid(info: providedInfo.vendorCompany, max: validLengthForVendorCompany) {
            throw DataError.vendorCompanyTooLong
        }
        
        if isValid(infoName: .dateOfBirth, info: dateToString(date: providedInfo.dateOfBirth)) {
            throw DataError.birthDateMissing
        }
        
        if isValid(infoName: .dateOfVisit, info: dateToString(date: providedInfo.dateOfVisit)) {
            throw DataError.dateOfVisitMissing
        }
    }
    
    
    
    
    func dateToString(date: Date?) -> String {
        guard let date = date else {
            return ""
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "mm/dd/yy"
        
        return formatter.string(from:date)
    }
    
}
