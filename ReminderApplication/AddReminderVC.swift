//
//  AddReminderViewController.swift
//  ReminderApplication
//
//  Created by Matt Ferlaino on 2020-12-04.
//

/*
 * Imports
 */
import UIKit

/*
 * Classes
 */
class AddReminderVC: UIViewController, UITextFieldDelegate {
    // Outlets
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var bodyTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    // Variables
    public var finish: ((String, String, Date) -> Void)?
    
    // Load main VC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Assign
        titleTextField.becomeFirstResponder()
        titleTextField.delegate = self
        bodyTextField.delegate = self
        
        // Add Save Button
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveButton))
    }
    
    // Save button was pressed
    @objc func saveButton() {
        if let bodyTxt = bodyTextField.text, !bodyTxt.isEmpty, let titleTxt = titleTextField.text, !titleTxt.isEmpty {
            let datePicked = datePicker.date
            finish?(titleTxt, bodyTxt, datePicked)
        }
    }
    
    // Text field navigation
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
