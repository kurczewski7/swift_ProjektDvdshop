//
//  FiltrViewController.swift
//  DVDShop
//
//  Created by Slawek Kurczewski on 08.05.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import UIKit

var database=Database()
class FiltrViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    //var filmsbase=[Filmsbase]()
    //let menagedContext=filmList.database.managedContext

    @IBAction func fieldSegmentAction(_ sender: UISegmentedControl) {
    }
  
    @IBOutlet var findValueTextField: UITextField!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var nameLabel: UILabel! {
        didSet {
            let ilosc=database.flimsbase.count
            nameLabel.text="x=\(Filmsbase.accessibilityElementCount()),\(ilosc)"
        }
    }
    @IBOutlet var priceName: UILabel! {
        didSet {    priceName.text=(database.flimsbase.count > 0) ?  database.flimsbase[0].pictureName : "Brak filmów w bazie"
        }
    }
    
    @IBAction func policzAction(_ sender: Any) {
         let wynik=database.policzRecords()
          titleLabel.text="Rekordow:\(wynik.allRecords),dostepnych:\(wynik.accesableRecords)"
    }
    
    @IBOutlet var typePickerData: UIPickerView!
    
    @IBAction func addAction(_ sender: Any) {
        database.setupDataFromAssets()
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        database.deleteTableBase()
    }
    @IBAction func nextAction(_ sender: Any) {
    }
    @IBAction func saveAction(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        database.loadData()
        database.setupDataFromAssets()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction  func unwindBeck(segue: UIStoryboardSegue) {
        
    }
    // MARK: Picker View
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return "co tam"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //kantor.numerBanku=row
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
