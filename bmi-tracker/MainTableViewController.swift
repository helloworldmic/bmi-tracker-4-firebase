//
//  MainTableViewController.swift
//  bmi-tracker
//
//  Created by mich on 14/12/2022.
//

import UIKit

class MainTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView! // NOT connect table view CELL!!!!!
  
    var record:[RecordList] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "BMI Tracker"
        // Do any additional setup after loading the view.
        buildInitialRecordListValue()
    }
    func buildInitialRecordListValue()->Void{
        record.append(RecordList(recordID: 1, weight: 62.0, bmi: 23.5, recordTime: Date(), bmiCategory: "Normal"))
        
        record.append(RecordList(recordID: 2, weight: 61.0, bmi: 23.05, recordTime: Date(), bmiCategory: "Normal"))
    }
let recordTableIdentifier = "RecordTableIdentifier"
    func initializeDatabaseTable(){}
    
    @IBAction func ButtonAdd_Pressed(_ sender: UIBarButtonItem) {
        let addRecordVC = storyboard?.instantiateViewController(withIdentifier: "AddRecord") as! AddRecordViewController
        
        addRecordVC.title = "Add New Record"
        navigationController?.pushViewController(addRecordVC, animated: true)
        
        //tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return record.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) // CELL's identfier, NOT TABLE's !!!!!!!!!!!!!!!!!
        //define only by clicking CELL, NOT Table!!!!!!!!!!!!
        
        let recordTimeString = record[indexPath.row].recordTime.formatted()
        
        if let recordWeight = cell.contentView.viewWithTag(1) as? UILabel{
            recordWeight.text =
            String(record[indexPath.row].weight)
        }
        if let recordBMI = cell.contentView.viewWithTag(2) as? UILabel{
            recordBMI.text = String(record[indexPath.row].bmi)
        }
        if let recordDateTime = cell.contentView.viewWithTag(3) as? UILabel{
            recordDateTime.text = recordTimeString
        }
        if let recordCategory = cell.contentView.viewWithTag(4) as? UILabel{
            recordCategory.text = record[indexPath.row].bmiCategory
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath)-> CGFloat{
        return 100
    }
    
    
    @IBAction func OpenButton_clicked(_ sender: UIButton) {
        
        
        let showRecordVC = storyboard?.instantiateViewController(withIdentifier: "ShowRecord") as! ShowRecordViewController
        
        showRecordVC.title = "Open"
        navigationController?.pushViewController(showRecordVC, animated: true)
    }
}
