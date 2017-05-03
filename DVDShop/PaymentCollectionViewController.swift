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
    private var trashEnabled=false
    private var selectedIcons: [Icon]=[]
    
    @IBOutlet var trashButton: UIBarButtonItem!
    
    
    // MARK: Action metod
    @IBAction func trashButtonTapped(sender: AnyObject) {
        print("trashEnabled=\(trashEnabled)")
        if trashEnabled {
            print("&&&&&")
            if selectedIcons.count  > 0
            {
            print("selectedIcons.count=\(selectedIcons.count)" )
            // Deselect all selected items
            if let indexPaths=collectionView?.indexPathsForSelectedItems {
                for indexPath in indexPaths {
                    collectionView?.deselectItem(at: indexPath, animated: false)
                    
                    // Remowe all items for selectedIcons array
                    selectedIcons.removeAll(keepingCapacity: true)
                        
                    // change the trash mode to NO
                    trashEnabled=false
                    collectionView?.allowsMultipleSelection=false
                    trashButton.title = "Odznacz"
                    trashButton.style=UIBarButtonItemStyle.plain
            
                    }
                }
            }
        }
        else
        {
            trashEnabled=true
            collectionView?.allowsMultipleSelection=true
            trashButton.title="Usuń"
            trashButton.style=UIBarButtonItemStyle.done
        }
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Sprawdza czy tryb trash jest włączony inaczej kończy metodę
        guard trashEnabled else {
            return
        }
        // okrela wybraną metodę użyeaną w indexPath
        let selectedIcon=zestawIcon[indexPath.row]
        
        // dodaje ikonę do tablicy wybranych
        selectedIcons.append(selectedIcon)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        // sprawdza czy tryb kosza jest dostępny, jeli nie kończy metodę
        guard trashEnabled else {
            return
        }
        let deSelectedIcon=zestawIcon[indexPath.row]
        // szuka indeksu odznaczonej ikony
        if let index=selectedIcons.index(where: {$0.name == deSelectedIcon.name}){
            selectedIcons.remove(at: index)
        }
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
        
        cell.filmImageView.image = UIImage(named: icon.name)
        cell.priceLabel.text = "\(price_str) zł"
        
        // cell.backgroundView=(icon.isFeatured) ? UIImageView(image: UIImage(named: "feature-bg")) : nil
        cell.selectedBackgroundView=UIImageView(image: UIImage(named: "icon-selected"))
        
        
//        if icon.isFeatured {
//            cell.backgroundColor=UIColor.red
//        }
    
        
//dane.price
//dane.filmImage
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
