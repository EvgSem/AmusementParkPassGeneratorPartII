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
    case passNotCreated
}


extension DataError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .missingPersonalInfo:
            return NSLocalizedString("Error. Missing Personal Info.", comment: "DataError")
        case .missingAccess:
            return NSLocalizedString("Error. Missing Access.", comment: "DataError")
        case .freeChildGuestAgeAboveLimit:
            return NSLocalizedString("Error. Free Child Guest Age is above limit.", comment: "DataError")
        case .birthDateMissing:
            return NSLocalizedString("Error. Date of birth missing.", comment: "DataError")
        case .lastNameMissing:
            return NSLocalizedString("Error. Last name missing.", comment: "DataError")
        case .firstNameMissing:
            return NSLocalizedString("Error. First name missing.", comment: "DataError")
        case .streetAddressMissing:
            return NSLocalizedString("Error. Street address missing.", comment: "DataError")
        case .cityMissing:
            return NSLocalizedString("Error. City missing.", comment: "DataError")
        case .stateMissing:
            return NSLocalizedString("Error. State missing.", comment: "DataError")
        case .zipCodeMissing:
            return NSLocalizedString("Error. Zip Code missing.", comment: "DataError")
        case .passNotCreated:
            return NSLocalizedString("Error. Pass was not created", comment: "DataError")
        case .dateOfVisitMissing:
            return NSLocalizedString("Error. Date of Visit missing.", comment: "DataError")
        case .vendorCompanyMissing:
            return NSLocalizedString("Error. Vendor company name missing.", comment: "DataError")

        }
    }
}
