//
//  FiltrViewController.swift
//  DVDShop
//
//  Created by Slawek Kurczewski on 08.05.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import UIKit

var database=Database()
class FiltrViewController: UIViewController {
    //var filmsbase=[Filmsbase]()
    //let menagedContext=filmList.database.managedContext

    @IBOutlet var obrazekImage: UIImageView!
        { didSet {
        if database.flimsbase.count>0{
            obrazekImage.image=UIImage(data: database.flimsbase[0].filmImage! as Data)
            }
        }
        
    }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
