//
//  AdminViewController.swift
//  DVDShop
//
//  Created by Slawek Kurczewski on 17.05.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {
    var tekst: String = ""
    var tx: [String] = ["","","","","","","","","","",""]
    let server = Server()
    
    
    @IBOutlet var textView: UITextView!
    @IBAction func getSqlButton(_ sender: UIButton) {
        textView.text = server.makeSqlTxt(database: database)
    }
    @IBAction func downloadButton(_ sender: UIButton) {
       
        server.getLatestDvds()
        print("Załadowano \(server.dvds.count) rekordów z sieci")
    }
    @IBAction func sentButton(_ sender: Any) {
        textView.text = server.makeJsonTxt(database: database)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
