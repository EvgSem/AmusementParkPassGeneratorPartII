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
        case .onFood10: return DiscountOnFood10Swiper()
        case .onFood15: return DiscountOnFood15Swiper()
        case .onFood25: return DiscountOnFood25Swiper()
        case .onMenchandise10: return DiscountOnMerch10Swiper()
        case .onMenchandise20: return DiscountOnMerch20Swiper()
        case .onMenchandise25: return DiscountOnMerch25Swiper()
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
