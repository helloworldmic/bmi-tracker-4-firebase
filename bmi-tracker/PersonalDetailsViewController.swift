//
//  PersonalDetailsViewController.swift
//  bmi-tracker
//
//  Created by mich on 12/12/2022.
//

import UIKit
import FirebaseCore
import Firebase     //no longer use import FirebaseDatabase


class PersonalDetailsViewController: UIViewController {
    var ref: DatabaseReference!
    
    
    @IBOutlet weak var firstWeightLabel: UILabel!
    @IBOutlet weak var firstHeightLabel: UILabel!
    @IBOutlet weak var usemetricFirst: UISwitch!
    @IBOutlet weak var editFirstWeight: UITextField!
    @IBOutlet weak var editFirstHeight: UITextField!
    @IBOutlet weak var firstBMI: UILabel!
    var weight:Float = 0.0 //may hv to change to another variable name
    var height:Float = 0.0
    var bmi:Float = 0.0
    // an instance of FIRDatabaseReference
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        // Do any additional setup after loading the view.
        usemetricFirst.isOn = true
    }
  
    @IBAction func useMetricAtFirst(_ sender: UISwitch) {        
        if(usemetricFirst.isOn){
            firstWeightLabel.text = "weight(in kg)"
            firstHeightLabel.text = "height(in m)"
        }
        else{
            firstWeightLabel.text = "weight(in lb)"
            firstHeightLabel.text = "height(in ft)"
        }
    }
    
    @IBAction func calculatefirstBMI(_ sender: UIButton) {
        weight =  Float(editFirstWeight.text!) ?? 0.0
        height = Float(editFirstHeight.text!) ?? 0.0
        if (usemetricFirst.isOn){
            let heightSq = height*height
            bmi = weight / heightSq
            firstBMI.text = String(bmi)
            print(bmi)
            print(firstBMI.text)
        }
        else{
        let heightToInchSq = height*12*height*12
            bmi = weight*703/heightToInchSq
            firstBMI.text = String(bmi)
            
        }
        print(weight)
        print(height)
    }

    @IBAction func AddFirstRecordButton_Clicked(_ sender: UIButton) {

//        let point = sender.convert(CGPoint.zero, to: tableView)
//        guard let indexpath = tableView.indexPathForRow(at: point)
//        else{return}
//
//        selectedTaskID = task[indexpath.row].taskID

        let showRecordTableVC = storyboard?.instantiateViewController(withIdentifier: "ShowRecordTable") as! MainTableViewController
        showRecordTableVC.title = "Open"
        navigationController?.pushViewController(showRecordTableVC, animated: true)
        
            }
    
   // no reaction when clicked
    @IBAction func goToRecordTable_clicked(_ sender: UIButton) {
        let goToRecordTableVC = storyboard?.instantiateViewController(withIdentifier: "ShowRecordTable") as! MainTableViewController
        goToRecordTableVC.title = "Open"
        navigationController?.pushViewController(goToRecordTableVC, animated: true)
        
        print("clicked") //printed but not action
    }
    
}
