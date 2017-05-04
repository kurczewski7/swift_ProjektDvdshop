//
//  ObliczViewController.swift
//  DVDShop
//
//  Created by Slawek Kurczewski on 02.05.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import UIKit

class ObliczViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
//    var kantor = Kantor()
    
    @IBOutlet var naleznoscLabel: UILabel!
    @IBOutlet var walutySegment: UISegmentedControl!
    @IBOutlet var wartoscWalucieLabel: UILabel!
    @IBOutlet var kursLabel: UILabel!
    @IBOutlet var bankiPickerView: UIPickerView!
    @IBOutlet var numerTransakcjiLabel: UILabel! {
        didSet {
            kantor.setTransactionId()
            numerTransakcjiLabel.text=kantor.giveTransactionNumberTxt()
        }
    }
    @IBOutlet var numerKontaLabel: UILabel! {
        didSet {
            numerKontaLabel.text=kantor.numerKonta
        }
    }
    
    
    @IBAction func zmianaWalutySegment(sender: UISegmentedControl) {
        wartoscWalucieLabel.text = kantor.giveValuteText(country: walutySegment.selectedSegmentIndex)
        kursLabel.text=kantor.giveKursText(country: walutySegment.selectedSegmentIndex)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
   
        let wynik=policz(selectedDvd: zestawIcon)
        kantor.setTotalPrice(totalPrice: wynik)

        naleznoscLabel.text = kantor.giveValuteText(country: 0)  //String.init(format: "%7.2f zł", wynik)
        wartoscWalucieLabel.text = kantor.giveValuteText(country: 0)  //String.init(format: "%7.2f zł", wynik)
        kursLabel.text=kantor.giveKursText(country: 0)
        
        //kantor.setTransactionId()


       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func policz(selectedDvd: [Icon]) -> Double {
        var suma: Double = 0.0
        for i in 0..<selectedDvd.count {
            if selectedDvd[i].isFeatured {
                suma+=selectedDvd[i].price
            }
        }
    return suma
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction  func unwindBeck(segue: UIStoryboardSegue) {
        
    }
    // MARK: Picker View
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return kantor.giveBankCount()
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //var allCodes=[String](kantor.urlBanku)
        //var kode=allCodes[row]
        return kantor.giveNameBank(nrBanku: row)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        kantor.numerBanku=row
    }

}
