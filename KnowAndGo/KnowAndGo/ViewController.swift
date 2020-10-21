//
//  ViewController.swift
//  KnowAndGo
//
//  Created by Joshua Tsao on 21/10/20.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

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

    lazy var countryTextField: UITextField = {
        let textfield = UITextField()
         textfield.translatesAutoresizingMaskIntoConstraints = false
         textfield.placeholder = "Pick your Country"
         textfield.borderStyle = .roundedRect

        let pickerView = UIPickerView()
         pickerView.dataSource = self
         pickerView.delegate = self

        textfield.inputView = pickerView
        
        
        return textfield
    }()
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event:UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.countries = self.getCountryList()
        
        self.view.addSubview(self.countryTextField)
        
        
        self.countryTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        self.countryTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        self.countryTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        
    }


}

