import Foundation


enum DataError: Error {
    case missingPersonalInfo
    case missingAccess
    case freeChildGuestAgeAboveLimit
    case birthDateMissing
    case firstNameMissing
    case lastNameMissing
    case streetAddressMissing
    case cityMissing
    case stateMissing
    case zipCodeMissing
    case dateOfVisitMissing
    case vendorCompanyMissing
    case vendorCompanyTooLong
    case passNotCreated
    case zipCodeTooLong
    case zipCodeMustHaveNumbersOnly
    case firstNameTooLong
    case lastNameTooLong
    case streetTooLong
    case cityTooLong
    case stateTooLong
    case projectNumberMissing
    case ssnMissing
}


extension DataError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .missingPersonalInfo:
            return NSLocalizedString("Missing Personal Info.", comment: "DataError")
        case .missingAccess:
            return NSLocalizedString("Missing Access.", comment: "DataError")
        case .freeChildGuestAgeAboveLimit:
            return NSLocalizedString("Free Child Guest Age is above limit.", comment: "DataError")
        case .birthDateMissing:
            return NSLocalizedString("Date of birth missing.", comment: "DataError")
        case .lastNameMissing:
            return NSLocalizedString("Last name missing.", comment: "DataError")
        case .firstNameMissing:
            return NSLocalizedString("First name missing.", comment: "DataError")
        case .streetAddressMissing:
            return NSLocalizedString("Street address missing.", comment: "DataError")
        case .cityMissing:
            return NSLocalizedString("City missing.", comment: "DataError")
        case .stateMissing:
            return NSLocalizedString("State missing.", comment: "DataError")
        case .zipCodeMissing:
            return NSLocalizedString("Zip Code missing.", comment: "DataError")
        case .passNotCreated:
            return NSLocalizedString("Pass was not created", comment: "DataError")
        case .dateOfVisitMissing:
            return NSLocalizedString("Date of Visit missing.", comment: "DataError")
        case .vendorCompanyMissing:
            return NSLocalizedString("Vendor company name missing.", comment: "DataError")
        case .vendorCompanyTooLong:
            return NSLocalizedString("Vendor company name is too long.", comment: "DataError")
        case .zipCodeTooLong:
            return NSLocalizedString("Zip code is too long", comment: "DataError")
        case .zipCodeMustHaveNumbersOnly:
            return NSLocalizedString("Zipcode must have numbers only", comment: "DataError")
        case .firstNameTooLong:
            return NSLocalizedString("First name is too long", comment: "DataError")
        case .lastNameTooLong:
            return NSLocalizedString("Last name is too long", comment: "DataError")
        case .streetTooLong:
            return NSLocalizedString("Street is too long", comment: "DataError")
        case .cityTooLong:
            return NSLocalizedString("City is too long", comment: "DataError")
        case .stateTooLong:
            return NSLocalizedString("State is too long", comment: "DataError")
        case .projectNumberMissing:
            return NSLocalizedString("Project Number missing.", comment: "DataError")
        case .ssnMissing:
            return NSLocalizedString("SSN missing.", comment: "DataError")
        }
    }
}
