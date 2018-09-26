import Foundation

enum GuestType {
    case classic
    case vip
    case freeChild
}


enum EmployeeType {
    case foodServices
    case rideServices
    case maintenance
    case manager
}


enum EntrantType {
    case guest(type: GuestType)
    case employee(type: EmployeeType)
    
    var areaAccess: [AreaAccess] {
        switch self {
        case .guest(let type):
            switch type{
                case .classic: return [.amusementAreas]
                case .vip: return [.amusementAreas]
                case .freeChild: return [.amusementAreas]
            }
        case .employee(let type):
            switch type{
            case .foodServices: return [.amusementAreas, .kitchenAreas]
            case .rideServices: return [.amusementAreas, .rideControlAreas]
            case .maintenance: return [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenanceAreas]
            case .manager: return [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenanceAreas, .officeAreas]
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
            }
        case .employee(let type):
            switch type{
            case .foodServices: return [.allRides]
            case .rideServices: return [.allRides]
            case .maintenance: return [.allRides]
            case .manager: return [.allRides]
            }
        
            
        }
    }
    
    
    var discountAccess: [DiscountAccess] {
        switch self {
        case .guest(let type):
            switch type{
            case .classic: return []
            case .vip: return [.onFood(percentage: 10)]
            case .freeChild: return []
            }
        case .employee(let type):
            switch type{
            case .foodServices: return [.onFood(percentage: 15), .onMenchandise(percentage: 25)]
            case .rideServices: return [.onFood(percentage: 15), .onMenchandise(percentage: 25)]
            case .maintenance: return [.onFood(percentage: 15), .onMenchandise(percentage: 25)]
            case .manager: return [.onFood(percentage: 25), .onMenchandise(percentage: 25)]
            }
        
            
        }
    }
    
    var requaredPersonalInfo: [RequiredPersonalInfo] {
        switch self {
        case .guest(let type):
            switch type{
            case .classic: return []
            case .vip: return []
            case .freeChild: return [.dateOfBirth]
            }
        case .employee(let type):
            switch type{
            case .foodServices: return [.firstName, .lastName, .streetAddress, .city, .state, .zip]
            case .rideServices: return [.firstName, .lastName, .streetAddress, .city, .state, .zip]
            case .maintenance: return [.firstName, .lastName, .streetAddress, .city, .state, .zip]
            case .manager: return [.firstName, .lastName, .streetAddress, .city, .state, .zip]
            }
        
            
        }
    }
    
}
