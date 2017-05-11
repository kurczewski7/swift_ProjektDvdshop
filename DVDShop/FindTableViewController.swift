//
//  FindTableViewController.swift
//  DVDShop
//
//  Created by Slawek Kurczewski on 08.05.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import UIKit

class FindTableViewController: UITableViewController {
    var database=Database()
    var fieldNameTmp  = ""
    var seekValueTmp = ""
    var fieldTypeTmp: TypeFilterFields = .tytul
    override func viewDidLoad() {
        super.viewDidLoad()
        database.filmsbaseFilter=database.fillFilterData(field: fieldTypeTmp, seekValue: seekValueTmp)
        
        
        self.title="Filmy znalezione: \(database.filmCount)"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  database.filmCount
    }
        //database.isFilterOn ?  database.filmsbaseFilter.count :  database.flimsbaseFull.count


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FindTableViewCell
        
        print("row TV =\(indexPath.row), filmCount=\(database.filmCount), flimsbaseFull.count=\(database.flimsbaseFull.count), filmsbaseFilter.count=\(database.filmsbaseFilter.count)")
        print("filtr:\(database.isFilterOn)")
        // Configure the cell...
        //let film=database.getFilm(row: indexPath.row)
        
        
        let row = database.getPhisicalRow(row: indexPath.row)
         //   database.filmsbaseFilter[0]
        //indexPath.row
        
        let film=database.getFilm(row: row)
        if database.filmCount > indexPath.row {
            cell.titleLabel.text=film.title
            cell.actorsLabel.text=film.actors
            cell.typLabel.text=film.type
            cell.priceLabel.text=String.init(format: "%6.2f", film.price)
            cell.DVDImage.image=UIImage(data: film.filmImage! as Data)
            print("tytul=\(cell.titleLabel)")
        }
        

        return cell
    }
    @IBAction  func unwindBeck(segue: UIStoryboardSegue) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier=="showFound" {
            if let indexPath=tableView.indexPathForSelectedRow {
                let destinatonController = segue.destination as! FoundDetailViewController
                
                //let rek=filmList.give(row: indexPath.row)
                
                let rek=database.getFilm(row: indexPath.row)
                destinatonController.dvdImageTmp   =  filmList.giveCurrentPictureName(row: indexPath.row)
                destinatonController.titleLabelTmp =  rek.title!
                destinatonController.actorsLabelTmp  =  rek.actors!
                destinatonController.typeLabelTmp  =  rek.type!
                destinatonController.priceLabelTmp =  kantor.doubleToString(rek.price)
                destinatonController.youtubeUrlTmp =  rek.youtubeUrl!
                destinatonController.descriptionLabelTmp = filmList.give(row: indexPath.row).description
                destinatonController.rowTmp=kantor.intToString(indexPath.row)
                destinatonController.phisicalRowTmp = kantor.intToString(database.getPhisicalRow(row: indexPath.row)) 
                
                print("segue showFound, row=\(indexPath.row)")
                //flimsbase[indexPath.row]
            }
        }
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
