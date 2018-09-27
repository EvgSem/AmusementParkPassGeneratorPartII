import UIKit

class ViewController: UIViewController {

    let amusementPark = AmusementPark()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amusementPark.createPass()
        amusementPark.checkAccess()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

