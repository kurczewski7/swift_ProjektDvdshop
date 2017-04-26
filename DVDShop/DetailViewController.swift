//
//  DetailViewController.swift
//  DVDShop
//
//  Created by Slawek Kurczewski on 27.04.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var dvdImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var actorsLabel: UILabel!
    @IBOutlet var typeLabel: UITextField!
    @IBOutlet var descriptionLabel: UITextField!
    @IBOutlet var priceLabel: UILabel!
    
    var dvdImageTmp = ""
    var titleLabelTmp = ""
    var actorsLabelTmp = ""
    var typeLabelTmp = ""
    var descriptionLabelTmp = "to jest film dobry"
    var priceLabelTmp = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dvdImage.image=UIImage(named: dvdImageTmp)
        titleLabel.text=titleLabelTmp
        actorsLabel.text=actorsLabelTmp
        typeLabel.text=typeLabelTmp
        descriptionLabel.text=descriptionLabelTmp
        priceLabel.text=priceLabelTmp
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
