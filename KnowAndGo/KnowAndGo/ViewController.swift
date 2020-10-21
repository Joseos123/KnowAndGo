//
//  ViewController.swift
//  KnowAndGo
//
//  Created by Joshua Tsao on 21/10/20.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    
    var countries:[String] = []

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        self.countries.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.countries[row]
    }


    func getCountryList() -> [String]{
        var countries : [String] = []
        for code in NSLocale.isoCountryCodes{
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found \(code)"
            countries.append(name)
        }

        return countries
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.countries = self.getCountryList()
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }


}

