//
//  ObliczViewController.swift
//  DVDShop
//
//  Created by Slawek Kurczewski on 02.05.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import UIKit

class ObliczViewController: UIViewController {

    @IBOutlet var naleznoscLabel: UILabel!
    @IBOutlet var walutySegment: UISegmentedControl!
    @IBOutlet var wartoscWalucieLabel: UILabel!
    @IBOutlet var kursLabel: UILabel!
    
    @IBAction func zmianaWalutySegment(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let wynik=policz(selectedDvd: zestawIcon)
        naleznoscLabel.text=String.init(format: "%7.2f zł", wynik)
        

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

}
