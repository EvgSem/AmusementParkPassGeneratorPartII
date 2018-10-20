import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var guestButton: UIButton!
    @IBOutlet weak var employeeButton: UIButton!
    @IBOutlet weak var managerButton: UIButton!
    @IBOutlet weak var vendorButton: UIButton!
    
    @IBOutlet weak var subType1Button: UIButton!
    @IBOutlet weak var subType2Button: UIButton!
    @IBOutlet weak var subType3Button: UIButton!
    @IBOutlet weak var subType4Button: UIButton!
    @IBOutlet weak var subType5Button: UIButton!
    
    
    let amusementPark = AmusementPark()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        amusementPark.createPass()
//        do {
//             try amusementPark.checkAccess()
//        } catch let error {
//           print(error.localizedDescription)
//        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func passTypeButtonTapped(_ sender: UIButton) {
        var tag = sender.titleLabel?.text
        print(tag)
//
//        switch tag {
//        case 0:
//            <#code#>
//        default:
//            <#code#>
//        }
       
        
       
        
        
    
    }
    
    
    @IBAction func passSubTypeButtonTapped(_ sender: Any) {
    
    
    
    }
    
}

