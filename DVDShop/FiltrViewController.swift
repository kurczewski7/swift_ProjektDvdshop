//
//  FiltrViewController.swift
//  DVDShop
//
//  Created by Slawek Kurczewski on 08.05.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import UIKit

class FiltrViewController: UIViewController {
    //var bazaFlmow=[Filmsbase]()
    //let menagedContext=filmList.database.managedContext

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceName: UILabel!
    
    @IBAction func policzAction(_ sender: Any) {
        // let wynik=filmList.database.policzRecords()
        //  titleLabel.text="Rekordow:\(wynik.allRecords),dostepnych:\(wynik.accesableRecords)"
    }
    
    @IBAction func addAction(_ sender: Any) {
    }
    
    @IBAction func deleteAction(_ sender: Any) {
    }
    @IBAction func nextAction(_ sender: Any) {
    }
    @IBAction func saveAction(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //filmList.database.loadData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
