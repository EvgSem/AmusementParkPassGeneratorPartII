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
        
        let startDate = Date()
        let endDate = date
        let difference = Calendar.current.dateComponents([.second], from: startDate, to: endDate)
        if difference.second! > 5 {
           return true
        } else {
            print("5 seconds interval did not pass")
            return false
        }
    }
    
    func swipe(pass: EntrantPass) throws -> String{
        return ""
    }
    
    func swipeMessage(isAccessable: Bool, pass: EntrantPass) -> String {
        accessGranted = isAccessable
        var birthdayGreeting = ""
        if pass.isBirthday {
            birthdayGreeting = "Happy birthday!"
        }
        SoundEffectsPalyer.playSound(for: self)
        if isAccessable {
            print("Welcome! \(birthdayGreeting)")
            return "Welcome! \(birthdayGreeting)"
        }
        print("\(birthdayGreeting) Sorry, You do not have an access here.")
        return "\(birthdayGreeting) Sorry, You do not have an access here."
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

        return swipeMessage(isAccessable: pass.rideAccess.contains(accessType)&&isPassValidNow(pass), pass: pass)
        
    }
}

class SkipLineSwiper: SwipeArea {
    var rideName: String
    
    init(rideName: String){
        self.rideName = rideName
        super.init(accessType: RideAccess.skipAllLines)
        self.description = "SkipLineSwiper checks SkipAllLines Access"
    }
    
    override func swipe(pass: EntrantPass) throws -> String {
        guard let accessType = self.accessType as? RideAccess  else {
            throw DataError.missingAccess
        }
        return swipeMessage(isAccessable: pass.rideAccess.contains(accessType)&&isPassValidNow(pass), pass: pass)
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
        return swipeMessage(isAccessable: pass.areaAccess.contains(accessType)&&isPassValidNow(pass), pass: pass)
    }
}


class DiscountSwiper: SwipeArea {
    var discountName: String
    
    init(discountName: String){
        self.discountName = discountName
        super.init(accessType: DiscountAccess.onFood(percentage: 15))
        self.description = "DiscountSwiper checks DicountOnFood for 15% Access"
    }
    
    override func swipe(pass: EntrantPass) throws -> String {
        guard let accessType = self.accessType as? DiscountAccess  else {
            throw DataError.missingAccess
        }
        return swipeMessage(isAccessable: pass.discountAccess.contains(where: {$0 == accessType})&&isPassValidNow(pass), pass: pass)
    }
}
