import UIKit

class CreatePassViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate  {
    
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
    @IBOutlet weak var ssnTitle: UILabel!
    @IBOutlet weak var projectNumberTitle: UILabel!
    @IBOutlet weak var lastNameTitle: UILabel!
    @IBOutlet weak var firstNameTitle: UILabel!
    @IBOutlet weak var streetAddressTitle: UILabel!
    @IBOutlet weak var cityTitle: UILabel!
    @IBOutlet weak var stateTitle: UILabel!
    @IBOutlet weak var zipcodeTitle: UILabel!
    @IBOutlet weak var dateOfVisitTitle: UILabel!
    @IBOutlet weak var dateOfBirthTextInput: UITextField!
    @IBOutlet weak var ssnTextInput: UITextField!
    @IBOutlet weak var projectNumberTextInput: UITextField!
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
    
    let datePickerView: UIDatePicker = UIDatePicker()
    let vendorCompanyPickerView: UIPickerView = UIPickerView()
    let projectNumberCompanyPickerView: UIPickerView = UIPickerView()
    
    let vendorCompaniesData = ["Acme", "Orkin", "Fedex", "NW Electrical"]
    let projectNumbersData = ["1001", "1002", "1003", "2001", "2002"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(CreatePassViewController.dismissPicker))
        
        dateOfBirthTextInput.inputAccessoryView = toolBar
        dateOfVisitTextInput.inputAccessoryView = toolBar
        vendorCompanyTextInput.inputAccessoryView = toolBar
        projectNumberTextInput.inputAccessoryView = toolBar
        
        vendorCompanyTextInput.inputView = vendorCompanyPickerView
        projectNumberTextInput.inputView = projectNumberCompanyPickerView
        vendorCompanyPickerView.delegate = self
        projectNumberCompanyPickerView.delegate = self
        
        ssnTextInput.delegate = self
        
        guestAdultConfiguration()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == vendorCompanyPickerView {
            return 4
        } else if pickerView == projectNumberCompanyPickerView {
            return 5
        } else {
            return 1
        }
        
        
        
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            if pickerView == vendorCompanyPickerView {
                return vendorCompaniesData[row]
            } else if pickerView == projectNumberCompanyPickerView {
                return projectNumbersData[row]
            } else {
                return ""
            }
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == vendorCompanyPickerView {
            editingTextFiled = vendorCompanyTextInput
            vendorCompanyTextInput.text = vendorCompaniesData[row]
            setEntrantTypeForVendor(vendorCompany: vendorCompaniesData[row])
        } else if pickerView == projectNumberCompanyPickerView {
            editingTextFiled = projectNumberTextInput
            projectNumberTextInput.text = projectNumbersData[row]
            setEntrantTypeForContract(projectNumber: projectNumbersData[row])
        }
    }
    
    func setEntrantTypeForContract(projectNumber: String) {
        guard let projectNumber = ProjectNumber(rawValue: projectNumber) else {
            return
        }
        
        switch projectNumber {
            case ._1001:
                selectedEntrantType = EntrantType.contract(projectNumber: ._1001)
            case ._1002:
                selectedEntrantType = EntrantType.contract(projectNumber: ._1002)
            case ._1003:
                selectedEntrantType = EntrantType.contract(projectNumber: ._1003)
            case ._2001:
                selectedEntrantType = EntrantType.contract(projectNumber: ._2001)
            case ._2002:
                selectedEntrantType = EntrantType.contract(projectNumber: ._2002)
        }
    }
    
    func setEntrantTypeForVendor(vendorCompany: String) {
        guard let vendorCompany = VendorCompany(rawValue: vendorCompany) else {
            return
        }
        
        switch vendorCompany {
            case .acme:
                selectedEntrantType = EntrantType.vendor(company: .acme)
            case .orkin:
                selectedEntrantType = EntrantType.vendor(company: .orkin)
            case .fedex:
                selectedEntrantType = EntrantType.vendor(company: .fedex)
            case .NWElectrical:
                selectedEntrantType = EntrantType.vendor(company: .NWElectrical)
        }
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
            let companyName = VendorCompany(rawValue: vendorCompanyTextInput.text ?? "Acme") ?? .acme
            selectedEntrantType = EntrantType.vendor(company: companyName)
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
                    selectedEntrantType = EntrantType.contract(projectNumber: ProjectNumber._1001)
                    employeeContractConfiguration()
                default:
                    selectedEntrantType = EntrantType.employee(type: EmployeeType.foodServices)
                    employeeConfiguration()
            }

            case .manager:
                selectedEntrantType = EntrantType.manager
                employeeConfiguration()
            case .vendor:
                selectedEntrantType = EntrantType.vendor(company: .acme)
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
                        vendorCompany: vendorCompanyTextInput.text,
                        projectNumber: projectNumberTextInput.text,
                        ssn: ssnTextInput.text)
        
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
    

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        
        guard let text = textField.text else {
            return true
        }
        if text.count == 3 || text.count == 6 {
            textField.text = "\(textField.text!)-"
        }
        
        let count = text.count + string.count - range.length
        return string == numberFiltered && count <= 11
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
