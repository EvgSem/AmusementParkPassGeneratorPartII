import Foundation

protocol Swipable {
    func swipe(pass: EntrantPass) throws -> String
}

class SwipeArea {
    var accessType: Access
    var accessGranted = false
    
    init(accessType: Access) {
        self.accessType = accessType
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
        print("\(birthdayGreeting) Sorry, You do not an access here.")
        return "\(birthdayGreeting) Sorry, You do not an access here."
    }
}

class RideSwiper: SwipeArea, Swipable {
    
    var rideName: String
    
    init(rideName: String){
        self.rideName = rideName
        super.init(accessType: RideAccess.allRides)
    }
    
    func swipe(pass: EntrantPass) throws -> String {
        guard let accessType = self.accessType as? RideAccess  else {
            throw DataError.missingAccess
        }

        return swipeMessage(isAccessable: pass.rideAccess.contains(accessType), pass: pass)
    }
}

class SkipLineSwiper: SwipeArea, Swipable {
    
    var rideName: String
    
    init(rideName: String){
        self.rideName = rideName
        super.init(accessType: RideAccess.skipAllLines)
    }
    
    func swipe(pass: EntrantPass) throws -> String {
        guard let accessType = self.accessType as? RideAccess  else {
            throw DataError.missingAccess
        }
        return swipeMessage(isAccessable: pass.rideAccess.contains(accessType), pass: pass)
    }
}

class AmusementAreaSwiper: SwipeArea, Swipable {
    
    var amusementAreaName: String
    
    init(amusementAreaName: String){
        self.amusementAreaName = amusementAreaName
        super.init(accessType: AreaAccess.amusementAreas)
    }
    
    func swipe(pass: EntrantPass) throws -> String {
        guard let accessType = self.accessType as? AreaAccess  else {
            throw DataError.missingAccess
        }
        return swipeMessage(isAccessable: pass.areaAccess.contains(accessType), pass: pass)
    }
}


class DiscountSwiper: SwipeArea, Swipable {
    
    var discountName: String
    
    init(discountName: String){
        self.discountName = discountName
        super.init(accessType: DiscountAccess.onFood(percentage: 10))
    }
    
    func swipe(pass: EntrantPass) throws -> String {
        guard let accessType = self.accessType as? DiscountAccess  else {
            throw DataError.missingAccess
        }
        return swipeMessage(isAccessable: pass.discountAccess.contains(where: {$0 == accessType}), pass: pass)
    }
}



