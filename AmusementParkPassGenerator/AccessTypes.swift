import Foundation

protocol Access {
    
}

enum AreaAccess: Access {
    case amusementAreas
    case kitchenAreas
    case rideControlAreas
    case maintenanceAreas
    case officeAreas
}


enum RideAccess: Access {
    case allRides
    case skipAllLines
}

enum DiscountAccess: Access, Equatable {
    case onFood(percentage: Int)
    case onMenchandise(percentage: Int)
    
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


