//
//  ReminderInfoVC.swift
//  ReminderApplication
//
//  Created by Matt Ferlaino on 2020-12-05.
//

/*
 * Imports
 */
import UIKit
import RealmSwift

/*
 * Classes
 */
class ReminderInfoVC: UIViewController, UITextFieldDelegate {
    // Outlets
    @IBOutlet weak var reminderTitle: UILabel!
    @IBOutlet weak var reminderBody: UITextField!
    @IBOutlet weak var reminderDate: UILabel!
    
    // Variables
    public var realmReminderObj: RealmReminderObj?
    public var realm: Realm?
    public var reminderInfoCompletionHandler: ((RealmReminderObj) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create Object
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM. d yyyy @ h:mm a"
        
        // Set Labels
        reminderTitle?.text = "\(realmReminderObj!.structure!.title)"
        reminderBody?.text = "\(realmReminderObj!.structure!.body)"
        reminderDate?.text = "\(realmReminderObj!.structure!.date)"
        
        // Add Delete Content
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteButton))
    }
    
    // Delete Reminders From Realm
    @objc private func deleteButton() {
        // Go back to root controller
        realm!.beginWrite()
        realm!.delete(realmReminderObj!)
        try! realm!.commitWrite()
        
        reminderInfoCompletionHandler?(realmReminderObj!)
        navigationController?.popToRootViewController(animated: true)
    }
}
