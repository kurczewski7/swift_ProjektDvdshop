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
    
    @IBOutlet var textView: UITextView!
    
    
    @IBAction func sentButton(_ sender: Any) {
        tekst = ""        
        for i in 0..<2  {   //database.flimsbaseFull.count{

            tx[0] = "{ \"dvds\" : ["
            tx[1] = "  {\"filmId\":\"\(database.flimsbaseFull[i].filmId ??  "brak")\""
            tx[2] = ",\"title\":\"\(database.flimsbaseFull[i].title ?? "")\""
            tx[3] = ",\"filmDirector\":\"\(database.flimsbaseFull[i].filmDirector ?? "")\""
            tx[4] = "\",\"actors\":\"\(database.flimsbaseFull[i].actors ?? "")\""
            tx[5] = ",\"type\":\"\(database.flimsbaseFull[i].type ?? "")\""
            tx[6] = ",\"filmDescription\":\"\(database.flimsbaseFull[i].filmDescription ?? "")\""
            tx[7] = ",\"filmImageName\":\"\(database.flimsbaseFull[0].pictureName ?? "")\""
            tx[8] = ",\"youtubeUrl\":\"\(database.flimsbaseFull[i].youtubeUrl ?? "")\""
            tx[9] = ",\"price\":\"\(database.flimsbaseFull[i].price )\""
            tx[10] = ",\"isLiked\":\"\(database.flimsbaseFull[i].isLiked ? "1" : "0")\"},  \n "
            for t in 0..<tx.count {
                tekst += tx[t]
            }
        }
        textView.text=tekst
        
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
