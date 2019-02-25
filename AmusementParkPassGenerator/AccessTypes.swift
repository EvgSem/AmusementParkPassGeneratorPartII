import Foundation

protocol Access {
    
}

enum AreaAccess: Access {
    case amusementAreas
    case kitchenAreas
    case rideControlAreas
    case maintenanceAreas
    case officeAreas
    
    var title: String {
        switch self {
        case .amusementAreas:
            return "Amusement Areas"
        case .kitchenAreas:
            return "Kitchen Areas"
        case .rideControlAreas:
            return "Ride Control Areas"
        case .maintenanceAreas:
            return "Maintenance Areas"
        case .officeAreas:
            return "Office Areas"
        }
    }
}


enum RideAccess: Access {
    case allRides
    case skipAllLines
    
    var title: String {
        switch self {
        case .allRides:
            return "All Rides"
        case .skipAllLines:
            return "Skip all Lines"
        }
    }
}

enum DiscountAccess: Access, Equatable {
    case onFood(percentage: Int)
    case onMenchandise(percentage: Int)
    
    var title: String {
        switch self {
        case let .onFood(percentage):
            return "On Food - \(percentage)%"
        case let .onMenchandise(percentage):
            return "On menchandise - \(percentage)%"
        }
    }
    
    public static func ==(lhs: DiscountAccess, rhs: DiscountAccess) -> Bool {
        switch (lhs, rhs) {
        case let (.onFood(percentage: a), .onFood(percentage: b)),
             let (.onMenchandise(percentage: a), .onMenchandise(percentage: b)):
            return a == b
        default:
            return false
        }
    }
    
}


