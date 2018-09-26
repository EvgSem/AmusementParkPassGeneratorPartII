import Foundation

protocol SwipeItemProtocol {

    var areaAccess: [AreaAccess] {get set}
    var rideAccess: [RideAccess] {get set}
    var discountAccess: [DiscountAccess] {get set}
    
    var isBirthday: Bool { get }
}

class EntrantPass: SwipeItemProtocol {
    
    var entrantType: EntrantType
    
    var areaAccess: [AreaAccess]
    var rideAccess: [RideAccess]
    var discountAccess: [DiscountAccess]
    
    var requaredPersonalInfo: [RequiredPersonalInfo]
    var providedPersonalInfo: Info?
    
    
    
    init(entrantType: EntrantType, providedPersonalInfo: Info?) throws {
        self.entrantType = entrantType
        self.areaAccess = entrantType.areaAccess
        self.rideAccess = entrantType.rideAccess
        self.discountAccess = entrantType.discountAccess
        self.requaredPersonalInfo = entrantType.requaredPersonalInfo
        
        
        let validator = Validator()
        do {
            try validator.validateProvidedPersonalInfo(entrantType: self.entrantType, prividedInfo: providedPersonalInfo)
        } catch let error {
            print(error.localizedDescription)
        }
        
        self.providedPersonalInfo = providedPersonalInfo
    }
    
    var isBirthday: Bool {
        get {
            if let info = providedPersonalInfo,  let dateOfBirth = info.dateOfBirth {
                let calendar = Calendar.current
                let birthDateComponents = calendar.dateComponents([.month, .day], from: dateOfBirth)
                let currentDateComponents = calendar.dateComponents([.month, .day], from: Date())
                
                if birthDateComponents.day == currentDateComponents.day && birthDateComponents.month == currentDateComponents.month {
                    return true
                }
            }
            return false
        }
    }
    
    
    
}
