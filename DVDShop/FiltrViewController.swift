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
            let ilosc=database.flimsbase.count
            nameLabel.text="x=\(Filmsbase.accessibilityElementCount()),\(ilosc)"
        }
    }
    @IBOutlet var priceName: UILabel! {
        didSet {    priceName.text=(database.flimsbase.count > 0) ?  database.flimsbase[0].pictureName : "Brak filmów w bazie"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        database.loadData()
        database.setupDataFromAssets()
        typePickerData.isUserInteractionEnabled=false
        findValueTextField.isUserInteractionEnabled=true
        // Do any additional setup after loading the view.
        //typePickerData.
        
//        print("SSSSSSS:\(TypeOfFilm.sciencefiction.hashValue)")
//        print("EEEEEEE:\(TypeOfFilm.sciencefiction.rawValue)")
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
