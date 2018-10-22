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
    
    @IBOutlet weak var entrantSubTypeStackView: UIStackView!
    
    var selectedEntrantTypeButton = EntrantTypeButtonTitles.guest
    
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
        setFontForButtonWithTag(sender.tag)
        
        
        
        let entrantTypes : [EntrantTypeButtonTitles] = [.guest, .employee, .manager, .vendor]
        
        let tappedButtonTitle = entrantTypes[sender.tag]
        switch tappedButtonTitle {
        case .guest:
            entrantSubTypeStackView.isHidden = false
            subType1Button.setTitle("Adult", for: .normal)
            subType2Button.setTitle("Child", for: .normal)
            subType3Button.setTitle("VIP", for: .normal)
            subType4Button.setTitle("Senior", for: .normal)
            subType5Button.setTitle("Season Pass", for: .normal)
        case .employee:
            entrantSubTypeStackView.isHidden = false
            subType1Button.setTitle("Food Services", for: .normal)
            subType2Button.setTitle("Ride Services", for: .normal)
            subType3Button.setTitle("Maintenance", for: .normal)
            subType4Button.setTitle("Contract", for: .normal)
            subType5Button.isHidden = true
        
        case .manager, .vendor:
            entrantSubTypeStackView.isHidden = true
        }

    }
    
    
    @IBAction func passSubTypeButtonTapped(_ sender: Any) {
    
    
    
    }
    
    
    
    //private
    func setFontForButtonWithTag(_ tag: Int){
        let buttons: [UIButton] = [guestButton, employeeButton, managerButton, vendorButton]
        
        let selectedColor = UIColor.white
        let notSelectedColor = UIColor(red: 208/255, green: 192/255, blue: 223/255, alpha: 1.0)
        
        
        selectedEntrantTypeButton = EntrantTypeButtonTitles.guest

        
        setFontForEntrantTypeButtons(tag: tag, buttons: buttons, selectedColor: selectedColor, notSelectedColor: notSelectedColor, fontSize: CGFloat(24))
    }
    
    func setFontForEntrantTypeButtons(tag: Int, buttons: [UIButton], selectedColor: UIColor, notSelectedColor: UIColor, fontSize: CGFloat){
        
        for i in 0..<buttons.count {
            if i == tag {
                buttons[i].setTitleColor(selectedColor, for: .normal)
                buttons[i].titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
                
            } else {
                buttons[i].setTitleColor(notSelectedColor, for: .normal)
                buttons[i].titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
            }
        }
        
    }
}


enum EntrantTypeButtonTitles: String {
    case guest = "Guest"
    case employee = "Employee"
    case manager = "Manager"
    case vendor = "Vendor"
}
