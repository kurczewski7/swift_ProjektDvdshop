//
//  PaymentCollectionViewController.swift
//  DVDShop
//
//  Created by Slawek Kurczewski on 02.05.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PaymentCollectionViewController: UICollectionViewController {
    @IBOutlet var trashButton: UIBarButtonItem!
    @IBAction func trashButtonTapped(_ sender: Any) {
    }
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        
        
        print("===============")
        print("polubienia.count \(polubienia.count)")
        zestawIcon.removeAll(keepingCapacity: false)
                for i in 0..<polubienia.count {
                    if polubienia[i] == true {
                        zestawIcon.append(Icon(name: filmList.giveIcon(row: i).name, price: filmList.giveIcon(row: i).price, isFeatured: (i % 3  == 0) ? true: false ))
                }
            }
        print("zestawIcon.count \(zestawIcon.count)")
        for i in 0..<zestawIcon.count{
             print("zestawIcon name\(i)  \(zestawIcon[i].name)")
             print("zestawIcon price\(i)  \(zestawIcon[i].price)")
            }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        
        // wykasowane
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return zestawIcon.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PaymentCollectionViewCell
    
        // Configure the cell
        
        //let dane = filmList.give(row: listaUlubionych[indexPath.row])
        
        let icon=zestawIcon[indexPath.row]
        let price_str = String(format: "%6.2f", icon.price)
        
        cell.filmImageView.image = UIImage(named: icon.name)       //dane.filmImage
        cell.priceLabel.text = "\(price_str) zł"          //dane.price
        
        if icon.isFeatured {
            cell.backgroundColor=UIColor.red
        }
    
        
        
    
//        cell.isLiked=dane.isLiked

    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
