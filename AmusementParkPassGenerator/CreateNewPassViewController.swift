//
//  CreateNewPassViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Ievgeniia Bondini on 10/21/18.
//  Copyright © 2018 Ievgeniia Bondini. All rights reserved.
//

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
    
    @IBOutlet weak var dicOnFood10AccessButton: UIButton!
    @IBOutlet weak var dicOnFood15AccessButton: UIButton!
    @IBOutlet weak var dicOnFood25AccessButton: UIButton!
    @IBOutlet weak var dicOnMerch10AccessButton: UIButton!
    @IBOutlet weak var dicOnMerch20AccessButton: UIButton!
    @IBOutlet weak var dicOnMerch25AccessButton: UIButton!
    
    
    @IBOutlet weak var accessTestinResultLabel: UILabel!
    
    @IBOutlet weak var createNewPassButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
