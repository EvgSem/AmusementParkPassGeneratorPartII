import Foundation

protocol Swipable {
    func swipe(pass: EntrantPass) throws -> String
}

class SwipeArea: Swipable {
    
    var swippedPasses: [EntrantPass: Date] = [:]
    var description: String
    var accessType: Access
    var accessGranted = false
    
    init(accessType: Access) {
        self.accessType = accessType
        self.description = ""
    }
    
    
    func addPass(pass: EntrantPass){
        swippedPasses[pass] = Date()
    }
    
    func isPassValidNow(_ swippedPass: EntrantPass) -> Bool {
        for (key, value) in swippedPasses {
            if swippedPasses[key] != nil {
                if fiveSecondsPassed(from: value) {
                    return true
                } else {
                    return false
                }
                
            }
        }
        addPass(pass: swippedPass)
        return true
    }
    
    func fiveSecondsPassed(from date: Date) -> Bool {
        
        let startDate = date
        let endDate = Date()
        let difference = Calendar.current.dateComponents([.second], from: startDate, to: endDate)
        if difference.second! > 5 {
           return true
        } else {
            return false
        }
    }
    
    func swipe(pass: EntrantPass) throws -> String{
        return ""
    }
    
    func swipeMessage(isAccessable: Bool, isPassValidNow: Bool, pass: EntrantPass) -> String {
        accessGranted = isAccessable
        
        if !isPassValidNow {
            return "Access denied. 5 seconds interval did not pass."
        }
        
        var greetingMessage = ""
        if pass.isBirthday {
            greetingMessage = "Happy birthday!"
        }
        SoundEffectsPalyer.playSound(for: self)
        if isAccessable {
            return "Access allowed! \(greetingMessage)"
        }
        return "Access denied"
    }
}

class RideSwiper: SwipeArea {

    var rideName: String
    
    init(rideName: String){
        self.rideName = rideName
        super.init(accessType: RideAccess.allRides)
        self.description = "RideSwiper checks AllRides Access"
    }
    
    override func swipe(pass: EntrantPass) throws -> String {
        
        guard let accessType = self.accessType as? RideAccess  else {
            throw DataError.missingAccess
        }
        return swipeMessage(isAccessable: pass.rideAccess.contains(accessType), isPassValidNow: isPassValidNow(pass), pass: pass)
        
    }
}

class KitchenSwiper: SwipeArea {
    
    var kitchenName: String
    
    init(kitchenName: String){
        self.kitchenName = kitchenName
        super.init(accessType: AreaAccess.kitchenAreas)
        self.description = "Restaurant checks kitchen Areas"
    }
    
    override func swipe(pass: EntrantPass) throws -> String {
        
        guard let accessType = self.accessType as? AreaAccess  else {
            throw DataError.missingAccess
        }
        
        return swipeMessage(isAccessable: pass.areaAccess.contains(accessType), isPassValidNow: isPassValidNow(pass), pass: pass)
    }
}

class MaintenanceSwiper: SwipeArea {
    
    init(){
        super.init(accessType: AreaAccess.maintenanceAreas)
        self.description = "Maintenance area"
    }
    
    override func swipe(pass: EntrantPass) throws -> String {
        
        guard let accessType = self.accessType as? AreaAccess  else {
            throw DataError.missingAccess
        }
        
        return swipeMessage(isAccessable: pass.areaAccess.contains(accessType), isPassValidNow: isPassValidNow(pass), pass: pass)
    }
}

class SeeEntrantAccessRulesSwiper: SwipeArea {
    
    init() {
        super.init(accessType: RideAccess.seeEntrantAccessRules)
        self.description = "See Entrant Access Rules"
    }
    
    override func swipe(pass: EntrantPass) throws -> String {
        
        guard let accessType = self.accessType as? RideAccess  else {
            throw DataError.missingAccess
        }
        
        return swipeMessage(isAccessable: pass.rideAccess.contains(accessType), isPassValidNow: isPassValidNow(pass), pass: pass)
    }
}



class OfficeSwiper: SwipeArea {
    
    var officeName: String
    
    init(officeName: String){
        self.officeName = officeName
        super.init(accessType: AreaAccess.officeAreas)
        self.description = "Main office checks Office Areas"
    }
    
    override func swipe(pass: EntrantPass) throws -> String {
        
        guard let accessType = self.accessType as? AreaAccess  else {
            throw DataError.missingAccess
        }
        
        return swipeMessage(isAccessable: pass.areaAccess.contains(accessType), isPassValidNow: isPassValidNow(pass), pass: pass)
    }
}

class RideControllSwiper: SwipeArea {
    
    var rideName: String
    
    init(rideName: String){
        self.rideName = rideName
        super.init(accessType: AreaAccess.rideControlAreas)
        self.description = "Everest ride checks Ride control areas"
    }
    
    override func swipe(pass: EntrantPass) throws -> String {
        
        guard let accessType = self.accessType as? AreaAccess  else {
            throw DataError.missingAccess
        }
        
        return swipeMessage(isAccessable: pass.areaAccess.contains(accessType), isPassValidNow: isPassValidNow(pass), pass: pass)
    }
}

class SkipLineSwiper: SwipeArea {
    
    init(){
        super.init(accessType: RideAccess.skipAllLines)
        self.description = "SkipLineSwiper checks SkipAllLines Access"
    }
    
    override func swipe(pass: EntrantPass) throws -> String {
        guard let accessType = self.accessType as? RideAccess  else {
            throw DataError.missingAccess
        }
        return swipeMessage(isAccessable: pass.rideAccess.contains(accessType), isPassValidNow: isPassValidNow(pass), pass: pass)
    }
}

class AmusementAreaSwiper: SwipeArea {
    var amusementAreaName: String
    
    init(amusementAreaName: String){
        self.amusementAreaName = amusementAreaName
        super.init(accessType: AreaAccess.amusementAreas)
        self.description = "AmusementAreaSwiper checks AmusementAreas Access"
    }
    
    override func swipe(pass: EntrantPass) throws -> String {
        guard let accessType = self.accessType as? AreaAccess  else {
            throw DataError.missingAccess
        }
        return swipeMessage(isAccessable: pass.areaAccess.contains(accessType), isPassValidNow: isPassValidNow(pass), pass: pass)
    }
}


class DiscountOnFoodSwiper: SwipeArea {
    
    init(dicount: Int){
        super.init(accessType: DiscountAccess.onFood(percentage: dicount))
        self.description = "DiscountSwiper checks DicountOnFood for \(dicount)% Access"
    }
    
    override func swipe(pass: EntrantPass) throws -> String {
        guard let accessType = self.accessType as? DiscountAccess  else {
            throw DataError.missingAccess
        }
        return swipeMessage(isAccessable: pass.discountAccess.contains(where: {$0 == accessType}), isPassValidNow: isPassValidNow(pass), pass: pass)
    }
}

class DiscountOnMerchSwiper: SwipeArea {
    
    init(dicount: Int){
        super.init(accessType: DiscountAccess.onMenchandise(percentage: dicount))
        self.description = "DiscountSwiper checks DicountOnMerch for \(dicount))% Access"
    }
    
    override func swipe(pass: EntrantPass) throws -> String {
        guard let accessType = self.accessType as? DiscountAccess  else {
            throw DataError.missingAccess
        }
        return swipeMessage(isAccessable: pass.discountAccess.contains(where: {$0 == accessType}), isPassValidNow: isPassValidNow(pass), pass: pass)
    }
}
