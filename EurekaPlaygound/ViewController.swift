//
//  ViewController.swift
//  EurekaPlaygound
//
//  Created by Luis Manuel Ramirez Vargas on 28/05/17.
//  Copyright © 2017 Luis Manuel Ramirez Vargas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Age: UILabel!
    @IBOutlet weak var Private: UILabel!
    @IBOutlet weak var Birthday: UILabel!
    @IBOutlet weak var Occupation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let defaults = UserDefaults.standard
        
        Name.text = "Name: \(defaults.string(forKey: "Name")!)"
        Age.text = "Age: \(defaults.integer(forKey: "Age"))"
        Private.text = "Private: \(defaults.bool(forKey: "Private"))"
        Birthday.text = "Birthday: \((defaults.object(forKey: "Birthday") as! Date?)!)"
        Occupation.text = "Occupation: \(defaults.string(forKey: "Occupation")!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

