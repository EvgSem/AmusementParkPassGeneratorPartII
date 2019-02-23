import Foundation

enum GuestType {
    case classic
    case vip
    case freeChild
    case seasonPass
    case senior
}


enum EmployeeType: Int {
    case foodServices = 1
    case rideServices
    case maintenance
}

enum VendorCompany: String {
    case acme = "Acme"
    case orkin = "Orkin"
    case fedex = "Fedex"
    case NWElectrical = "NW Electrical"
}

enum ProjectNumber: String {
    case _1001 = "1001"
    case _1002 = "1002"
    case _1003 = "1003"
    case _2001 = "2001"
    case _2002 = "2002"
    
}

enum EntrantType {
    case guest(type: GuestType)
    case employee(type: EmployeeType)
    case manager
    case vendor(company: VendorCompany)
    case contract(projectNumber: ProjectNumber)
    
    var areaAccess: [AreaAccess] {
        switch self {
        case .guest(let type):
            switch type{
                case .classic: return [.amusementAreas]
                case .vip: return [.amusementAreas]
                case .freeChild: return [.amusementAreas]
                case .seasonPass: return [.amusementAreas]
                case .senior: return [.amusementAreas]
            }
        case .employee(let type):
            switch type{
            case .foodServices: return [.amusementAreas, .kitchenAreas]
            case .rideServices: return [.amusementAreas, .rideControlAreas]
            case .maintenance: return [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenanceAreas]
            
            
           
            }
        case .manager: return [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenanceAreas, .officeAreas]
        case .vendor(let company):
            switch company {
                case .acme: return [.kitchenAreas]
                case .orkin: return [.amusementAreas, .rideControlAreas, .kitchenAreas]
                case .fedex: return [.maintenanceAreas, .officeAreas]
                case .NWElectrical: return [.amusementAreas, .rideControlAreas, .kitchenAreas, .maintenanceAreas, .officeAreas]
            }
        case .contract(let projectNumber):
            switch projectNumber {
                case ._1001: return [.amusementAreas, .rideControlAreas]
                case ._1002: return [.amusementAreas, .rideControlAreas, .maintenanceAreas]
                case ._1003: return [.amusementAreas, .rideControlAreas, .kitchenAreas, .maintenanceAreas, .officeAreas]
                case ._2001: return [.officeAreas]
                case ._2002: return [.maintenanceAreas, .kitchenAreas]
            }
            
        }
    }
    
    var rideAccess: [RideAccess] {
        switch self {
        case .guest(let type):
            switch type{
            case .classic: return [.allRides]
            case .vip: return [.allRides, .skipAllLines]
            case .freeChild: return [.allRides]
            case .seasonPass: return [.allRides, .skipAllLines]
            case .senior: return [.allRides, .skipAllLines]
            }
        case .employee(let type):
            switch type{
            case .foodServices: return [.allRides]
            case .rideServices: return [.allRides]
            case .maintenance: return [.allRides]
            
            
            
            }
        case .manager: return [.allRides]
        case .vendor: return [.seeEntrantAccessRules]
        case .contract: return [.seeEntrantAccessRules]
            
        }
    }
    
    
    var discountAccess: [DiscountAccess] {
        switch self {
        case .guest(let type):
            switch type{
            case .classic: return []
            case .vip: return [.onFood(percentage: 10), .onMenchandise(percentage: 10)]
            case .freeChild: return []
            case .seasonPass: return [.onFood(percentage: 10), .onMenchandise(percentage: 20)]
            case .senior: return [.onFood(percentage: 10), .onMenchandise(percentage: 10)]
            }
        case .employee(let type):
            switch type{
            case .foodServices: return [.onFood(percentage: 15), .onMenchandise(percentage: 25)]
            case .rideServices: return [.onFood(percentage: 15), .onMenchandise(percentage: 25)]
            case .maintenance: return [.onFood(percentage: 15), .onMenchandise(percentage: 25)]
            }
            case .manager: return [.onFood(percentage: 25), .onMenchandise(percentage: 25)]
            case .vendor: return []
            case .contract: return []
        }
    }
    
    var requaredPersonalInfo: [RequiredPersonalInfo] {
        switch self {
        case .guest(let type):
            switch type{
            case .classic: return []
            case .vip: return []
            case .freeChild: return [.dateOfBirth]
            case .seasonPass: return [.firstName, .lastName, .streetAddress, .city, .state, .zip]
            case .senior: return [.firstName, .lastName, .dateOfBirth]
                
            }
        case .employee(let type):
            switch type{
            case .foodServices: return [.firstName, .lastName, .streetAddress, .city, .state, .zip]
            case .rideServices: return [.firstName, .lastName, .streetAddress, .city, .state, .zip]
            case .maintenance: return [.firstName, .lastName, .streetAddress, .city, .state, .zip]
            }
        case .manager: return [.firstName, .lastName, .streetAddress, .city, .state, .zip]
        case .vendor: return [.firstName, .lastName, .vendorCompany, .dateOfVisit, .dateOfBirth]
        case .contract: return [.firstName, .lastName, .streetAddress, .city, .state, .zip, .ssn, .projectNumber]
            
        }
    }
    
    var name: String {
        switch self {
        case .guest(let type):
            switch type{
            case .classic: return "Adult Guest Pass"
            case .vip: return "VIP Guest Pass"
            case .freeChild: return "Child Guest Pass"
            case .seasonPass: return "Season Guest Pass"
            case .senior: return "Senior Guest Pass"
            }
        case .employee(let type):
            switch type{
            case .foodServices: return "Food services Employee Pass"
            case .rideServices: return "RideServices Employee Pass"
            case .maintenance: return "Maintenance Employee Pass"
            
        }
        case .manager: return "Manager Pass"
        case .vendor(let company):
            switch company {
            case .acme: return "Vendor Pass. Company \(VendorCompany.acme.rawValue)"
            case .orkin: return "Vendor Pass. Company \(VendorCompany.orkin.rawValue)"
            case .fedex: return "Vendor Pass. Company \(VendorCompany.fedex.rawValue)"
            case .NWElectrical: return "Vendor Pass. Company \(VendorCompany.NWElectrical.rawValue)"
            }
        case  .contract(let projectNumber):
            switch projectNumber {
            case ._1001: return "Contract Employee Pass. Project#: \(ProjectNumber._1001.rawValue)"
            case ._1002: return "Contract Employee Pass. Project#: \(ProjectNumber._1002.rawValue)"
            case ._1003: return "Contract Employee Pass. Project#: \(ProjectNumber._1003.rawValue)"
            case ._2001: return "Contract Employee Pass. Project#: \(ProjectNumber._2001.rawValue)"
            case ._2002: return "Contract Employee Pass. Project#: \(ProjectNumber._2002.rawValue)"
            }
        }
    }
    
}
