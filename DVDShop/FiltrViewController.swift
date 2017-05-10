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
    // MARK: Outlets
    
    @IBOutlet var fleldSegmentControll: UISegmentedControl!
    @IBOutlet var typePickerData: UIPickerView!
    @IBOutlet var findValueTextField: UITextField!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var nameLabel: UILabel! {
        didSet {
            let ilosc=database.filmCount
            nameLabel.text="x=\(Filmsbase.accessibilityElementCount()),\(ilosc)"
        }
    }
    @IBOutlet var priceName: UILabel! {
        didSet {    priceName.text=(database.filmCount > 0) ?  database.getFilm(row: 0).pictureName : "Brak filmów w bazie"
            //database.flimsbase[0].pictureName
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        database.loadData()
        database.setupDataFromAssets()
        
        // database.isFilterOn=false
        typePickerData.isUserInteractionEnabled=false
        findValueTextField.isUserInteractionEnabled=true
        
        
        // Do any additional setup after loading the view.
    }
    // MARK: Action functions
    @IBAction func fieldSegmentAction(_ sender: UISegmentedControl) {
        findValueTextField.keyboardType = .namePhonePad
        findValueTextField.text=""
        typePickerData.isUserInteractionEnabled=false
        findValueTextField.isUserInteractionEnabled=true
        findValueTextField.returnKeyType = .done
        
        switch fleldSegmentControll.selectedSegmentIndex
        {
        case 0: findValueTextField.placeholder="Wpisz szukany tytuł"
        case 1: findValueTextField.placeholder=""
                findValueTextField.text=typeOfFilm[typePickerData.selectedRow(inComponent: 0)].rawValue
                findValueTextField.endEditing(true)
                typePickerData.isUserInteractionEnabled=true
                findValueTextField.isUserInteractionEnabled=false
            
        case 2: findValueTextField.placeholder="Wpisz szukanego aktora"
        case 3: findValueTextField.placeholder="Wpisz maksymalną cenę"
                findValueTextField.keyboardType = .decimalPad
        default: findValueTextField.placeholder=""
        }

    }
    @IBAction func policzAction(_ sender: Any) {
         let wynik=database.policzRecords()
          titleLabel.text="Rekordow:\(wynik.allRecords),dostepnych:\(wynik.accesableRecords)"
    }
    @IBAction func addAction(_ sender: Any) {
        database.setupDataFromAssets()
    }
    @IBAction func deleteAction(_ sender: Any) {
        database.deleteTableBase()
    }
    @IBAction func nextAction(_ sender: Any) {
        database.setFilter(field: .tytul, seekValue: "Bogowie")
    }
    @IBAction func saveAction(_ sender: Any) {
    }
    @IBAction  func unwindBeck(segue: UIStoryboardSegue) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Picker View --------
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return typeOfFilm.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return typeOfFilm[row].rawValue
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if fleldSegmentControll.selectedSegmentIndex == 1 {
            findValueTextField.text=typeOfFilm[row].rawValue
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier=="showSeek" {
            let destinatonController = segue.destination as! FindTableViewController
            
            switch fleldSegmentControll.selectedSegmentIndex {
                case 0: database.fillFilterData(field:  .tytul,   seekValue: findValueTextField.text!)
                case 1:database.fillFilterData(field:   .gatunek, seekValue: findValueTextField.text!)
                case 2:database.fillFilterData(field:   .aktorzy, seekValue: findValueTextField.text!)
                case 3:database.fillFilterData(field:   .cenaDo,  seekValue: findValueTextField.text!)
                default: database.fillFilterData(field: .tytul,   seekValue: findValueTextField.text!)
            }
            destinatonController.fieldNameTmp=""
            destinatonController.seekValue=""
            database.fillFilterData(field: .tytul, seekValue: "Bogowie")
                
            print("segue showSeek)")
        }
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
