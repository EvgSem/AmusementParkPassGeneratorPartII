import Foundation

enum RequiredPersonalInfo {
    
    case firstName
    case lastName
    case streetAddress
    case city
    case state
    case zip
    case dateOfBirth
    case dateOfVisit
    case vendorCompany
    case projectNumber
    case ssn
}

struct Info {
    var dateOfBirth: Date?
    var firstName: String?
    var lastName: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var dateOfVisit: Date?
    var vendorCompany: String?
    var projectNumber: String?
    var ssn: String?
}
