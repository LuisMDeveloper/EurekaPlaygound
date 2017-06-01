//
//  SettingsFormViewController.swift
//  EurekaPlaygound
//
//  Created by Luis Manuel Ramirez Vargas on 29/05/17.
//  Copyright © 2017 Luis Manuel Ramirez Vargas. All rights reserved.
//

import Eureka

class SettingsFormViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
        form +++ Section("General Info")
            <<< NameRow(){ row in
                row.title = "Name"
                row.placeholder = "Your name here"
            }.cellSetup { cell, row in
                row.value = defaults.string(forKey: "Name")
            }.onChange { row in
                defaults.set(row.value, forKey: "Name")
                row.updateCell()
            }
            <<< IntRow(){ row in
                row.title = "Age"
                row.placeholder = "Your age here"
            }.cellSetup { cell, row in
                row.value = defaults.integer(forKey: "Age")
            }.onChange { row in
                defaults.set(row.value, forKey: "Age")
                row.updateCell()
            }
            <<< SwitchRow() { row in
                row.title = "Private Profile"
            }.cellSetup { cell, row in
                row.value = defaults.bool(forKey: "Private")
            }.onChange { row in
                defaults.set(row.value, forKey: "Private")
                row.updateCell()
            }
            +++ Section("Extra Info")
            <<< DateRow(){
                $0.title = "Birthday"
                $0.value = Date(timeIntervalSinceReferenceDate: 0)
            }.cellSetup { cell, row in
                row.value = defaults.object(forKey: "Birthday") as! Date?
            }.onChange { row in
                defaults.set(row.value, forKey: "Birthday")
                row.updateCell()
            }
        
        form +++ SelectableSection<ListCheckRow<String>>("What is your occupation?", selectionType: .singleSelection(enableDeselection: true))
        
        let occupations = ["Application analyst", "Computer scientist", "Computer analyst", "Database administrator", "Data scientist", "Network administrator", "Developer", "Security engineer"]
        for option in occupations {
            form.last! <<< ListCheckRow<String>(option){ listRow in
                listRow.title = option
                listRow.selectableValue = option
                listRow.value = nil
            }.cellSetup { cell, row in
                //defaults.string(forKey: "Occupation")!
                if (row.selectableValue! == defaults.string(forKey: "Occupation")!) {
                    //print("row.select()")
                    row.value = row.selectableValue
                }
            }.onChange { row in
                defaults.set(row.value, forKey: "Occupation")
                row.updateCell()
            }
        }

    }

}
