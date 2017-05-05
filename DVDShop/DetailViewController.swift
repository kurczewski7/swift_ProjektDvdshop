//
//  DetailViewController.swift
//  DVDShop
//
//  Created by Slawek Kurczewski on 27.04.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var dvdImageTmp = ""
    var titleLabelTmp = ""
    var actorsLabelTmp = ""
    var typeLabelTmp = ""
    var descriptionLabelTmp = ""
    var priceLabelTmp = ""
    var youtubeUrlTmp = ""
    

    @IBOutlet var dvdImage: UIImageView!
    @IBOutlet var titleLabel: UILabel! {
        didSet {
            titleLabel.text=titleLabelTmp
        }
    }
    @IBOutlet var actorsLabel: UILabel! {
        didSet {
            actorsLabel.text="brak"
        }    }
    @IBOutlet var typeLabel: UILabel! {
        didSet {
            typeLabel.text=typeLabelTmp
        }    }
    @IBOutlet var priceLabel: UILabel! {
        didSet {
            priceLabel.text=priceLabelTmp
        }    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dvdImage.image=UIImage(named: dvdImageTmp)
        
        //actorsLabel.text=actorsLabelTmp
       // typeLabel.text=typeLabelTmp
        
        
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier=="showYoutube" {
           
                let destinatonController = segue.destination as! VideoViewController
                
                destinatonController.titleLabelTmp = titleLabelTmp
                destinatonController.typeLabelTmp  = typeLabelTmp
                destinatonController.priceLabelTmp = priceLabelTmp
                destinatonController.youtubeUrlTmp = youtubeUrlTmp
                destinatonController.dvdImageTmp   = dvdImageTmp
        }
    }
}
