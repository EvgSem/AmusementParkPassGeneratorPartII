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
    case contract
}


enum EntrantType {
    case guest(type: GuestType)
    case employee(type: EmployeeType)
    case manager
    case vendor
    
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
            
            case .contract: return [.amusementAreas, .kitchenAreas]
           
            }
        case .manager: return [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenanceAreas, .officeAreas]
         case .vendor: return [.amusementAreas, .kitchenAreas]
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
            
            case .contract: return [.seeEntrantAccessRules]
            
            }
        case .manager: return [.allRides]
        case .vendor: return [.seeEntrantAccessRules]
            
        }
    }
    
    
    var discountAccess: [DiscountAccess] {
        switch self {
        case .guest(let type):
            switch type{
            case .classic: return []
            case .vip: return [.onFood(percentage: 10)]
            case .freeChild: return []
            case .seasonPass: return [.onFood(percentage: 10), .onMenchandise(percentage: 20)]
            case .senior: return [.onFood(percentage: 10), .onMenchandise(percentage: 10)]
            }
        case .employee(let type):
            switch type{
            case .foodServices: return [.onFood(percentage: 15), .onMenchandise(percentage: 25)]
            case .rideServices: return [.onFood(percentage: 15), .onMenchandise(percentage: 25)]
            case .maintenance: return [.onFood(percentage: 15), .onMenchandise(percentage: 25)]
            
            case .contract: return []
            }
            case .manager: return [.onFood(percentage: 25), .onMenchandise(percentage: 25)]
            case .vendor: return []
            
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
            
            case .contract: return [.firstName, .lastName, .streetAddress, .city, .state, .zip]
            
            }
            case .manager: return [.firstName, .lastName, .streetAddress, .city, .state, .zip]
            case .vendor: return [.firstName, .lastName, .vendorCompany, .dateOfVisit]
        }
    }
    
}
