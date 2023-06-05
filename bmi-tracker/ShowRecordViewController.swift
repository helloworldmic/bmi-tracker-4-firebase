//
//  ShowRecordViewController.swift
//  bmi-tracker
//
//  Created by mich on 11/12/2022.
//

import UIKit

class ShowRecordViewController: UIViewController {
    
    @IBOutlet weak var editWeightText: UITextField!
    
    @IBOutlet weak var editHeightText: UITextField!
    
    @IBOutlet weak var updatedBMILabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        editWeightText.text = "60.0"
        editHeightText.text = "159.5"
        updatedBMILabel.text = "23.4"
        // Do any additional setup after loading the view.
    }
    
    
    
// can put back to table view controller later
//    @IBAction func buttonAdd_Clicked(_ sender: UIBarButtonItem) {
//
//        let addRecordVC = storyboard?.instantiateViewController(withIdentifier: "AddRecord") as! AddRecordViewController
//        addRecordVC.title = "Add New Record"
//        navigationController?.pushViewController(addRecordVC, animated: true)
//
//    }
    
}
