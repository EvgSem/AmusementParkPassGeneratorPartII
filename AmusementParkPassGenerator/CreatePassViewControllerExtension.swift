import Foundation

extension CreatePassViewController {
    
    
    func guestAdultConfiguration() {
        
        clearPersonalData()
        dateOfBirthTitle.textColor = disabledLabelTextColor
        firstNameTitle.textColor = disabledLabelTextColor
        lastNameTitle.textColor = disabledLabelTextColor
        streetAddressTitle.textColor = disabledLabelTextColor
        cityTitle.textColor = disabledLabelTextColor
        stateTitle.textColor = disabledLabelTextColor
        zipcodeTitle.textColor = disabledLabelTextColor
        dateOfVisitTitle.textColor = disabledLabelTextColor
        vendorCompanyTitle.textColor = disabledLabelTextColor
        
        dateOfBirthTextInput.isEnabled = false
        firtsNameTextInput.isEnabled = false
        lastNameTextInput.isEnabled = false
        streetAddressTextInput.isEnabled = false
        cityTextInput.isEnabled = false
        stateTextInput.isEnabled = false
        zipcodeTextInput.isEnabled = false
        dateOfVisitTextInput.isEnabled = false
        vendorCompanyTextInput.isEnabled = false
    }
    
    func guestChildConfiguration() {
        
        clearPersonalData()
        dateOfBirthTitle.textColor = enabledLabelTextColor
        firstNameTitle.textColor = disabledLabelTextColor
        lastNameTitle.textColor = disabledLabelTextColor
        streetAddressTitle.textColor = disabledLabelTextColor
        cityTitle.textColor = disabledLabelTextColor
        stateTitle.textColor = disabledLabelTextColor
        zipcodeTitle.textColor = disabledLabelTextColor
        dateOfVisitTitle.textColor = disabledLabelTextColor
        vendorCompanyTitle.textColor = disabledLabelTextColor
        
        dateOfBirthTextInput.isEnabled = true
        firtsNameTextInput.isEnabled = false
        lastNameTextInput.isEnabled = false
        streetAddressTextInput.isEnabled = false
        cityTextInput.isEnabled = false
        stateTextInput.isEnabled = false
        zipcodeTextInput.isEnabled = false
        dateOfVisitTextInput.isEnabled = false
        vendorCompanyTextInput.isEnabled = false
        
    }
    
    func guestSeniorConfiguration() {
        
        clearPersonalData()
        dateOfBirthTitle.textColor = enabledLabelTextColor
        firstNameTitle.textColor = enabledLabelTextColor
        lastNameTitle.textColor = enabledLabelTextColor
        streetAddressTitle.textColor = disabledLabelTextColor
        cityTitle.textColor = disabledLabelTextColor
        stateTitle.textColor = disabledLabelTextColor
        zipcodeTitle.textColor = disabledLabelTextColor
        dateOfVisitTitle.textColor = disabledLabelTextColor
        vendorCompanyTitle.textColor = disabledLabelTextColor
        
        dateOfBirthTextInput.isEnabled = true
        firtsNameTextInput.isEnabled = true
        lastNameTextInput.isEnabled = true
        streetAddressTextInput.isEnabled = false
        cityTextInput.isEnabled = false
        stateTextInput.isEnabled = false
        zipcodeTextInput.isEnabled = false
        dateOfVisitTextInput.isEnabled = false
        vendorCompanyTextInput.isEnabled = false
    }
    
    func guestSeasonConfiguration() {
        
        clearPersonalData()
        dateOfBirthTitle.textColor = disabledLabelTextColor
        firstNameTitle.textColor = enabledLabelTextColor
        lastNameTitle.textColor = enabledLabelTextColor
        streetAddressTitle.textColor = enabledLabelTextColor
        cityTitle.textColor = enabledLabelTextColor
        stateTitle.textColor = enabledLabelTextColor
        zipcodeTitle.textColor = enabledLabelTextColor
        dateOfVisitTitle.textColor = disabledLabelTextColor
        vendorCompanyTitle.textColor = disabledLabelTextColor
        
        dateOfBirthTextInput.isEnabled = false
        firtsNameTextInput.isEnabled = true
        lastNameTextInput.isEnabled = true
        streetAddressTextInput.isEnabled = true
        cityTextInput.isEnabled = true
        stateTextInput.isEnabled = true
        zipcodeTextInput.isEnabled = true
        dateOfVisitTextInput.isEnabled = false
        vendorCompanyTextInput.isEnabled = false
    }
    
    
    func employeeConfiguration() {
        
        clearPersonalData()
        dateOfBirthTitle.textColor = disabledLabelTextColor
        firstNameTitle.textColor = enabledLabelTextColor
        lastNameTitle.textColor = enabledLabelTextColor
        streetAddressTitle.textColor = enabledLabelTextColor
        cityTitle.textColor = enabledLabelTextColor
        stateTitle.textColor = enabledLabelTextColor
        zipcodeTitle.textColor = enabledLabelTextColor
        dateOfVisitTitle.textColor = disabledLabelTextColor
        vendorCompanyTitle.textColor = disabledLabelTextColor
        
        dateOfBirthTextInput.isEnabled = false
        firtsNameTextInput.isEnabled = true
        lastNameTextInput.isEnabled = true
        streetAddressTextInput.isEnabled = true
        cityTextInput.isEnabled = true
        stateTextInput.isEnabled = true
        zipcodeTextInput.isEnabled = true
        dateOfVisitTextInput.isEnabled = false
        vendorCompanyTextInput.isEnabled = false
    }
    
    func vendorConfiguration() {
        
        clearPersonalData()
        dateOfBirthTitle.textColor = enabledLabelTextColor
        firstNameTitle.textColor = enabledLabelTextColor
        lastNameTitle.textColor = enabledLabelTextColor
        streetAddressTitle.textColor = disabledLabelTextColor
        cityTitle.textColor = disabledLabelTextColor
        stateTitle.textColor = disabledLabelTextColor
        zipcodeTitle.textColor = disabledLabelTextColor
        dateOfVisitTitle.textColor = enabledLabelTextColor
        vendorCompanyTitle.textColor = enabledLabelTextColor
        
        dateOfBirthTextInput.isEnabled = true
        firtsNameTextInput.isEnabled = true
        lastNameTextInput.isEnabled = true
        streetAddressTextInput.isEnabled = false
        cityTextInput.isEnabled = false
        stateTextInput.isEnabled = false
        zipcodeTextInput.isEnabled = false
        dateOfVisitTextInput.isEnabled = true
        vendorCompanyTextInput.isEnabled = true
    }
    
    func clearPersonalData(){
        dateOfBirthTextInput.text = ""
        firtsNameTextInput.text = ""
        lastNameTextInput.text = ""
        streetAddressTextInput.text = ""
        cityTextInput.text = ""
        stateTextInput.text = ""
        zipcodeTextInput.text = ""
        dateOfVisitTextInput.text = ""
        vendorCompanyTextInput.text = ""
    }
    
    func showData(personalInfo: Info) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        var dateOfBirth = ""
        if let date = personalInfo.dateOfBirth {
            dateOfBirth = dateFormatter.string(from: date)
        }
        
        var dateOfVisit = ""
        if let date = personalInfo.dateOfVisit {
            dateOfVisit = dateFormatter.string(from: date)
        }
        
        
        dateOfBirthTextInput.text = dateOfBirth
        firtsNameTextInput.text = personalInfo.firstName ?? ""
        lastNameTextInput.text = personalInfo.lastName ?? ""
        streetAddressTextInput.text = personalInfo.streetAddress ?? ""
        cityTextInput.text = personalInfo.city ?? ""
        stateTextInput.text = personalInfo.state ?? ""
        zipcodeTextInput.text = personalInfo.zipCode ?? ""
        dateOfVisitTextInput.text = dateOfVisit
        vendorCompanyTextInput.text = personalInfo.vendorCompany ?? ""
    }
}
