//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Ievgeniia Bondini on 9/22/18.
//  Copyright © 2018 Ievgeniia Bondini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let amusementPark = AmusementPark()
        amusementPark.createPass()
        amusementPark.checkAccess()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

