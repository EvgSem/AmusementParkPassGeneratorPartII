import Foundation

class AmusementPark {
    
    var pass: EntrantPass?
    var swipers: [SwipeArea] = []
    
    
    init() {
        
    }

    func createPass() {
        print("========= Create Pass Test ===============")
        
        var info = Info()
        info.dateOfBirth = setDate(for: "2016/09/28")
        
        //Uncomment this block to create Employee Entrant Type
                info.firstName = "Max"
                info.lastName = "Pecu"
                info.streetAddress = "200 River Oaks Parkway"
                info.city = "Menlo Park"
                info.zipCode = "95122"
                info.state = "California"

        
        do {
            //        pass = try EntrantPass(entrantType: EntrantType.guest(type: .freeChild), providedPersonalInfo: info)
            //        pass = try EntrantPass(entrantType: EntrantType.guest(type: .classic), providedPersonalInfo: nil)
            //        pass = try EntrantPass(entrantType: EntrantType.guest(type: .vip), providedPersonalInfo: nil)
                      pass = try EntrantPass(entrantType: EntrantType.employee(type: .foodServices), providedPersonalInfo: info)
            //        pass = try EntrantPass(entrantType: EntrantType.employee(type: .rideServices), providedPersonalInfo: info)
            //        pass = try EntrantPass(entrantType: EntrantType.employee(type: .maintenance), providedPersonalInfo: info)
            //        pass = try EntrantPass(entrantType: EntrantType.employee(type: .manager), providedPersonalInfo: info)

            print("Test passed. Pass created successfully ... ")
        } catch let error {
            print(error.localizedDescription)
            print("Test failed. Pass was not created ... ")
        }
        
        
    }
    
    
    func checkAccess() throws {
        guard let pass = pass else {
            throw DataError.passNotCreated
        }
        
        print("\n ========= Check Access Test ===============")
        
        swipers = [RideSwiper(rideName: "Crazy Rock"),
                   SkipLineSwiper(rideName: "High Peek"),
                   AmusementAreaSwiper(amusementAreaName: "Main Pool"),
                   DiscountSwiper(discountName: "15% Food in Ice cream Shop")]
        print("There are \(swipers.count) Swipers to test ... \n")
        
        var i = 1
        for swiper in swipers {
            print("Test Swiper # \(i) \n")
            do {
                print(swiper.description)
                _ = try swiper.swipe(pass: pass)
            } catch let error {
                print(error.localizedDescription)
            }
            i += 1
            print("----------------------------------------")
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
