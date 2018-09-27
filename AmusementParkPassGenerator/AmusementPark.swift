import Foundation

class AmusementPark {
    
    var pass: EntrantPass?
    var swipers: [SwipeArea] = []
    
    
    init() {
        
    }

    func createPass() {
        var info = Info()
        info.dateOfBirth = setDate(for: "2016/09/26")
        
        //Uncomment this block to create Employee Entrant Type
                info.firstName = "Max"
                info.lastName = "Pecu"
                info.streetAddress = "200 River Oaks Parkway"
                info.city = "Menlo Park"
                info.zipCode = "95122"
                info.state = "California"

        
        do {
            pass = try EntrantPass(entrantType: EntrantType.guest(type: .freeChild), providedPersonalInfo: info)
            //        pass = try EntrantPass(entrantType: EntrantType.guest(type: .classic), providedPersonalInfo: nil)
            //        pass = try EntrantPass(entrantType: EntrantType.guest(type: .vip), providedPersonalInfo: nil)
            //        pass = try EntrantPass(entrantType: EntrantType.employee(type: .foodServices), providedPersonalInfo: info)
            //        pass = try EntrantPass(entrantType: EntrantType.employee(type: .rideServices), providedPersonalInfo: info)
            //        pass = try EntrantPass(entrantType: EntrantType.employee(type: .maintenance), providedPersonalInfo: info)
            //        pass = try EntrantPass(entrantType: EntrantType.employee(type: .manager), providedPersonalInfo: info)

        
        } catch let error {
            print(error.localizedDescription)
        }
        
        
    }
    
    
    func checkAccess(){
        swipers = [RideSwiper(rideName: "Crazy Rock"),
                   SkipLineSwiper(rideName: "High Peek"),
                   AmusementAreaSwiper(amusementAreaName: "Main Pool"),
                   DiscountSwiper(discountName: "10% Food in Ice cream Shop")]

        for swiper in swipers {
            if let pass = pass {
                do{
                   try swiper.swipe(pass: pass)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
        
        // comment for loop above and uncomment block below if you want to test 5 second limit
        
//        if let pass = pass {
//            do{
//                try swipers[0].swipe(pass: pass)
//                try swipers[0].swipe(pass: pass)
//            } catch let error {
//                print(error.localizedDescription)
//            }
//        }
        
    }
    
//    func clearSwippedPasses() {
//        for swiper in swipers {
//            swiper.swippedPasses = []
//        }
//    }
    
    private func setDate(for dateString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        if let someDateTime = formatter.date(from: dateString) {
            return someDateTime
        } else {
            return nil
        }
    }
    
}
