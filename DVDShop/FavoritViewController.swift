//
//  FavoritViewController.swift
//  DVDShop
//
//  Created by Slawek Kurczewski on 29.04.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import UIKit

class FavoritViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,FavoriteCollectionViewCellDelegate {
    
    var film: Film = Film()
    @IBOutlet var collectionView: UICollectionView!
    
    //private
    

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
    
    // MARK: wypełnienie protokołu
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaUlubionych.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FavoriteCollectionViewCell
        let dane = filmList.give(row: listaUlubionych[indexPath.row])
        
        cell.titleLabel.text = dane.title
        cell.typeLabel.text = dane.type
        cell.priceLabel.text = dane.price
      
        cell.imageView.image = dane.filmImage
        cell.isLiked=dane.isLiked
        return cell
    }
    
    // MARK: wypełnienie mojego zdefiniowanego protokółu
    func didLikeButtonPressed(cell: FavoriteCollectionViewCell) {
//        if let indexPath=collectionView.indexPath(for: cell) {
//            let newValue = filmList.give(row: indexPath.row).isLiked ? false : true
//            cell.isLiked = newValue //filmList.give(row: indexPath.row).isLiked
//            filmList.setIsLike(row: indexPath.row, isLike: newValue)
//         }
    }
    

}
