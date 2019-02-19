import Foundation


class SwipeAreaFactory {
    var swipeAreas: [SwipeArea] = []
    
    func create(accessButton: AccessButtonTag) -> SwipeArea {
        let newAccessArea = accessButton.instance as SwipeArea
        
        for area in swipeAreas {
            if type(of: area) == type(of: newAccessArea) {
                return area
            }
        }
        swipeAreas.append(newAccessArea)
        return newAccessArea
    }
}

enum AccessButtonTag: Int {
    case amusementAreas = 0
    case rideControlAreas = 1
    case kitchenAreas = 2
    case maintenanceAreas
    case officeAreas
    case allRides
    case skipAllLines
    case seeEntrantAccessRules
    case onFood10
    case onFood15
    case onFood25
    case onMenchandise10
    case onMenchandise20
    case onMenchandise25
    
    var instance: SwipeArea {
        
        switch self {
        case .amusementAreas: return AmusementAreaSwiper(amusementAreaName: "Amusement Area")
        case .kitchenAreas: return KitchenSwiper(kitchenName: "Restaurant")
        case .rideControlAreas: return RideControllSwiper(rideName: "Everest")
        case .maintenanceAreas: return MaintenanceSwiper()
        case .officeAreas: return OfficeSwiper(officeName: "Main office")
        case .allRides: return RideSwiper(rideName: "Ride Swiper")
        case .skipAllLines: return SkipLineSwiper()
        case .seeEntrantAccessRules: return SeeEntrantAccessRulesSwiper()
        case .onFood10: return DiscountOnFoodSwiper(dicount: 10)
        case .onFood15: return DiscountOnFoodSwiper(dicount: 15)
        case .onFood25: return DiscountOnFoodSwiper(dicount: 25)
        case .onMenchandise10: return DiscountOnMerchSwiper(dicount: 10)
        case .onMenchandise20: return DiscountOnMerchSwiper(dicount: 20)
        case .onMenchandise25: return DiscountOnMerchSwiper(dicount: 25)
        }
    }
}

class AccessTesting {

    var swipeAreaFactory = SwipeAreaFactory()
    
    func test(entrantPass: EntrantPass, accessTag: Int) -> String {
        
        let testAccess = AccessButtonTag(rawValue: accessTag)
        guard let testButton = testAccess else {
            return ""
        }
       
        let access = swipeAreaFactory.create(accessButton: testButton)
        
        let resultAccess = try! access.swipe(pass: entrantPass)
        return resultAccess
    }
 
}
