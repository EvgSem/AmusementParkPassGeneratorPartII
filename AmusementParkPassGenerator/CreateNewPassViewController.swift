import UIKit

class CreateNewPassViewController: UIViewController {
    
    
    @IBOutlet weak var passDecorationView: UIView!
    @IBOutlet weak var passView: UIView!
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var passNameTitle: UILabel!
    @IBOutlet weak var listOfAccessesTitle: UILabel!
    
    
    @IBOutlet weak var amusementAreaAccessButton: UIButton!
    @IBOutlet weak var ridetAreaAccessButton: UIButton!
    @IBOutlet weak var kitchenAreaAccessButton: UIButton!
    @IBOutlet weak var maintenanceAreaAccessButton: UIButton!
    @IBOutlet weak var officeAreaAccessButton: UIButton!
    
    @IBOutlet weak var allRidesAccessButton: UIButton!
    @IBOutlet weak var skipAllRideLinesAccessButton: UIButton!
    
    
    @IBOutlet weak var seeEntrantAccessRulesAccessButton: UIButton!
    
    @IBOutlet weak var dicOnFood10AccessButton: UIButton!
    @IBOutlet weak var dicOnFood15AccessButton: UIButton!
    @IBOutlet weak var dicOnFood25AccessButton: UIButton!
    @IBOutlet weak var dicOnMerch10AccessButton: UIButton!
    @IBOutlet weak var dicOnMerch20AccessButton: UIButton!
    @IBOutlet weak var dicOnMerch25AccessButton: UIButton!
    
    
    @IBOutlet weak var accessTestinResultLabel: UILabel!
    @IBOutlet weak var createNewPassButton: UIButton!
    
    var entrantPass: EntrantPass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listOfAccessesTitle.minimumScaleFactor = 0.1
        listOfAccessesTitle.adjustsFontSizeToFitWidth = true
        
        presentPass()
    }
    
    
    func presentPass() {
        
        let requiredInfo = entrantPass!.entrantType.requaredPersonalInfo
        passNameTitle.text = entrantPass!.entrantType.name
        if requiredInfo.contains(.lastName) {
            nameTitle.isHidden = false
            nameTitle.text = "\(entrantPass!.providedPersonalInfo!.firstName!) \(entrantPass!.providedPersonalInfo!.lastName!)"
        } else {
            nameTitle.isHidden = true
        }
        
        setListOfAccessInformation()
    }
    
    
    @IBAction func createNewPassButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "GeneratePass") as? ViewController
        if let viewController = viewController {
            present(viewController, animated: true, completion: nil)
        }
    }
    
    func setListOfAccessInformation(){
        
        var accessTitle = ""
        
       let entrantType = entrantPass!.entrantType 
        
        for access in entrantType.areaAccess {
            accessTitle += "\u{2022} \(access.title) \n"
        }
        
        for access in entrantType.rideAccess {
            accessTitle += "\u{2022} \(access.title) \n"
        }
        
        for access in entrantType.discountAccess {
            accessTitle += "\u{2022} \(access.title) \n"
        }
        
        listOfAccessesTitle.text = accessTitle
        print(accessTitle)
    }
    
    @IBAction func accessButtonTest(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        
        let tag = button.tag
        let accessTest = AccessTesting()
        accessTestinResultLabel.text = accessTest.test(entrantPass: entrantPass!, accessTag: tag)
    }

}
