import UIKit

class ViewController: UIViewController {

    let amusementPark = AmusementPark()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amusementPark.createPass()
        do {
             try amusementPark.checkAccess()
        } catch let error {
           print(error.localizedDescription)
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

