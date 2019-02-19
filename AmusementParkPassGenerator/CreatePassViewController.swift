import UIKit

class CreatePassViewController: UIViewController, UITextFieldDelegate {
    
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
    @IBOutlet weak var dateOfBirthTitle: UILabel!
    @IBOutlet weak var lastNameTitle: UILabel!
    @IBOutlet weak var firstNameTitle: UILabel!
    @IBOutlet weak var streetAddressTitle: UILabel!
    @IBOutlet weak var cityTitle: UILabel!
    @IBOutlet weak var stateTitle: UILabel!
    @IBOutlet weak var zipcodeTitle: UILabel!
    @IBOutlet weak var dateOfVisitTitle: UILabel!
    @IBOutlet weak var dateOfBirthTextInput: UITextField!
    @IBOutlet weak var firtsNameTextInput: UITextField!
    @IBOutlet weak var lastNameTextInput: UITextField!
    @IBOutlet weak var streetAddressTextInput: UITextField!
    @IBOutlet weak var cityTextInput: UITextField!
    @IBOutlet weak var stateTextInput: UITextField!
    @IBOutlet weak var zipcodeTextInput: UITextField!
    @IBOutlet weak var dateOfVisitTextInput: UITextField!
    @IBOutlet weak var generatePassButton: UIButton!
    @IBOutlet weak var populateDataButton: UIButton!
    
    
    @IBOutlet weak var vendorCompanyTitle: UILabel!
    
    @IBOutlet weak var vendorCompanyTextInput: UITextField!
    
    
    
    var editingTextFiled: UITextField?
    
    let disabledLabelTextColor = UIColor(displayP3Red: 190/255, green: 186/255, blue: 194/255, alpha: 1.0)
    let enabledLabelTextColor = UIColor(displayP3Red: 80/255, green: 78/255, blue: 82/255, alpha: 1.0)
    
    var selectedEntrantTypeButton = EntrantTypeButtonTitles.guest
    var selectedEntrantType = EntrantType.guest(type: GuestType.classic)
    let datePickerView  : UIDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(CreatePassViewController.dismissPicker))
        
        dateOfBirthTextInput.inputAccessoryView = toolBar
        dateOfVisitTextInput.inputAccessoryView = toolBar
        
        guestAdultConfiguration()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func passTypeButtonTapped(_ sender: UIButton) {
        
        setFontForTypeButtonWithTag(sender.tag)
        
        let entrantTypes : [EntrantTypeButtonTitles] = [.guest, .employee, .manager, .vendor]
        
        let tappedButtonTitle = entrantTypes[sender.tag]
        switch tappedButtonTitle {
        case .guest:
            selectedEntrantType = EntrantType.guest(type: GuestType.classic)
            setFontForSubTypeButtonWithTag(0)
            guestAdultConfiguration()
            selectedEntrantTypeButton = EntrantTypeButtonTitles.guest
            entrantSubTypeStackView.isHidden = false
            subType1Button.setTitle("Adult", for: .normal)
            subType2Button.setTitle("Child", for: .normal)
            subType3Button.setTitle("Senior", for: .normal)
            subType4Button.setTitle("VIP", for: .normal)
            subType5Button.setTitle("Season Pass", for: .normal)
            subType5Button.isHidden = false
        case .employee:
            selectedEntrantType = EntrantType.employee(type: EmployeeType.foodServices)
            setFontForSubTypeButtonWithTag(0)
            employeeConfiguration()
            selectedEntrantTypeButton = EntrantTypeButtonTitles.employee
            entrantSubTypeStackView.isHidden = false
            subType1Button.setTitle("Food Services", for: .normal)
            subType2Button.setTitle("Ride Services", for: .normal)
            subType3Button.setTitle("Maintenance", for: .normal)
            subType4Button.setTitle("Contract", for: .normal)
            subType5Button.isHidden = true
        
        case .manager:
            selectedEntrantType = EntrantType.manager
            employeeConfiguration()
            selectedEntrantTypeButton = EntrantTypeButtonTitles.manager
            entrantSubTypeStackView.isHidden = true
        case .vendor:
            selectedEntrantType = EntrantType.vendor
            vendorConfiguration()
            selectedEntrantTypeButton = EntrantTypeButtonTitles.vendor
            entrantSubTypeStackView.isHidden = true
        }
    }
    
    
    @IBAction func passSubTypeButtonTapped(_ sender: Any) {
        let buttonTag = (sender as? UIButton)?.tag
        
        setFontForSubTypeButtonWithTag(buttonTag!)
        
        switch selectedEntrantTypeButton {
            case .guest:
                switch buttonTag {
                case 0:
                    selectedEntrantType = EntrantType.guest(type: GuestType.classic)
                    guestAdultConfiguration()
                case 1:
                    selectedEntrantType = EntrantType.guest(type: GuestType.freeChild)
                    guestChildConfiguration()
                case 2:
                    selectedEntrantType = EntrantType.guest(type: GuestType.senior)
                    guestSeniorConfiguration()
                case 3:
                    selectedEntrantType = EntrantType.guest(type: GuestType.vip)
                    guestAdultConfiguration()
                case 4:
                    selectedEntrantType = EntrantType.guest(type: GuestType.seasonPass)
                    guestSeasonConfiguration()
                default:
                    selectedEntrantType = EntrantType.guest(type: GuestType.classic)
                    guestAdultConfiguration()
                    
                }
            case .employee:
                switch buttonTag {
                case 0:
                    selectedEntrantType = EntrantType.employee(type: EmployeeType.foodServices)
                    employeeConfiguration()
                case 1:
                    selectedEntrantType = EntrantType.employee(type: EmployeeType.rideServices)
                    employeeConfiguration()
                case 2:
                    selectedEntrantType = EntrantType.employee(type: EmployeeType.maintenance)
                    employeeConfiguration()
                case 3:
                    selectedEntrantType = EntrantType.employee(type: EmployeeType.contract)
                    employeeConfiguration()
                default:
                    selectedEntrantType = EntrantType.employee(type: EmployeeType.foodServices)
                    employeeConfiguration()
            }

            case .manager:
                selectedEntrantType = EntrantType.manager
                employeeConfiguration()
            case .vendor:
                selectedEntrantType = EntrantType.vendor
                vendorConfiguration()
        }
    }

    
    @IBAction func generatePassButtonPressed(_ sender: Any) {
        
        let dateOfBirth = stringToDate(dateOfBirthTextInput.text!)
        let dateOfVisit = stringToDate(dateOfVisitTextInput.text!)
        
        let personalInfo = Info(dateOfBirth: dateOfBirth,
                        firstName: firtsNameTextInput.text,
                        lastName: lastNameTextInput.text,
                        streetAddress: streetAddressTextInput.text,
                        city: cityTextInput.text,
                        state: stateTextInput.text,
                        zipCode: zipcodeTextInput.text,
                        dateOfVisit: dateOfVisit,
                        vendorCompany: vendorCompanyTextInput.text)
        
        let validateAlert = UIAlertController(title: "Missing data", message: "Some information if missing.", preferredStyle: UIAlertController.Style.alert)
        
        validateAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
        }))
  
       let validator = Validator(entrantType: selectedEntrantType, providedInfo: personalInfo)
        do {
            try validator.validate()
        } catch  {
            validateAlert.message = error.localizedDescription
            present(validateAlert, animated: true, completion: nil)
            return
        }
        
        
        let storyboard = UIStoryboard(name: "Pass", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "CreateNewPassVC") as! PassViewController
        try! controller.entrantPass = EntrantPass(entrantType: selectedEntrantType, providedPersonalInfo: personalInfo)
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func PopulateDateButtonPressed(_ sender: Any) {
        
        let dataPopulation = DataPopulation(entrantType: selectedEntrantType)
        let personalInfo = dataPopulation.populate()
        showData(personalInfo: personalInfo)
        
    }
    
    @IBAction func dateField(sender: UITextField) {
        editingTextFiled = sender
       
        datePickerView.datePickerMode = UIDatePicker.Mode.date
        sender.delegate = self
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action:  #selector(self.handleDatePicker), for: UIControl.Event.valueChanged)
        
    }
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        var timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .short
        timeFormatter.timeStyle = .none
        editingTextFiled!.text = timeFormatter.string(from: sender.date)
    }
    
    
    
    //private
    @objc func dismissPicker(){
        editingTextFiled?.endEditing(true)
    }
    
    func stringToDate(_ stringDate: String) -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yy"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        if let date = dateFormatter.date(from:stringDate) {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day, .hour], from: date)
            let finalDate = calendar.date(from:components)
            return finalDate
        }
        
        return nil
        
    }
    
    
    func setFontForTypeButtonWithTag(_ tag: Int){
        let buttons: [UIButton] = [guestButton, employeeButton, managerButton, vendorButton]
        
        let selectedColor = UIColor.white
        let notSelectedColor = UIColor(red: 208/255, green: 192/255, blue: 223/255, alpha: 1.0)
        
        let types : [EntrantTypeButtonTitles] = [.guest, .employee, .manager, .vendor]
        selectedEntrantTypeButton = types[tag]

        setFontForEntrantTypeButtons(tag: tag, buttons: buttons, selectedColor: selectedColor, notSelectedColor: notSelectedColor, fontSize: CGFloat(24))
    }
    
    
    func setFontForSubTypeButtonWithTag(_ tag: Int) {
        let buttons: [UIButton] = [subType1Button, subType2Button, subType3Button,  subType4Button,  subType5Button]
        
        let selectedColor = UIColor.white
        let notSelectedColor = UIColor(red: 208/255, green: 192/255, blue: 223/255, alpha: 1.0)
        
        setFontForEntrantTypeButtons(tag: tag, buttons: buttons, selectedColor: selectedColor, notSelectedColor: notSelectedColor, fontSize: CGFloat(20))
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
extension UITextField {
    override open var isEnabled: Bool {
        willSet {
            
            let disabledBcgdColor =  UIColor(displayP3Red: 219/255, green: 214/255, blue: 223/255, alpha: 1.0)
            let enabledBcgdColor =  UIColor.white
            let enabledBorderColor =  UIColor(displayP3Red: 219/255, green: 214/255, blue: 223/255, alpha: 1.0).cgColor
            let disabledBorderColor = UIColor(displayP3Red: 190/255, green: 186/255, blue: 194/255, alpha: 1.0).cgColor
            backgroundColor = newValue ? enabledBcgdColor : disabledBcgdColor
            layer.borderWidth = 1.0
            layer.cornerRadius = 5
            layer.borderColor = newValue ? enabledBorderColor : disabledBorderColor
        }
    }
}
