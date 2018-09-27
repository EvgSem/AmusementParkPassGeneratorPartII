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
