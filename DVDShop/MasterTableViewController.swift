//
//  MasterTableViewController.swift
//  DVDShop
//
//  Created by Slawek Kurczewski on 26.04.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//
import UIKit



// MARK: Wczytywanie danych zewnętrznych do obiektu

var filmList:FilmList = FilmList(filmsName: obrazki, titles: tytuly, actorsList: aktorzy, typeList: typyFilmow, descriptions: opisyFilmow, priceList: cenyFilmow, youtubeUrlList: youtubeUrls, likedList: polubienia)

//var database: Database
class MasterTableViewController: UITableViewController {
    
//        let titles = ["Ostatni wojownik","Ogniem i mieczem","Jak zostać królem"]
//        let actors = ["Bruce Lee","Dustin Hoffman","Harisson Ford"]
//        let types = ["Science ficton","Horror","Komedia romantyczna"]
    let prices:[Double] = [22.50,17.99,34.40,49.99,75.50]
    
    var film: TypeOfFilm = .horror
    
    let  dvdFilm: (picture: String, title: String, actors: String, type: TypeOfFilm, price: String) = (picture: "obrazek",  title: "tytul",  actors: "Aktorzy", type: .horror, price: "Cena")
    var dvdFilms = [(picture: String, title: String, actors: String, type: TypeOfFilm, price: String)]()
    var myDvd = ("aaa", "bbb", "cccc", TypeOfFilm.komedia)
    
    @IBAction func refreshActionBarButton(_ sender: Any) {
       tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readSampleData()
        tableView.reloadData()
        self.title="Filmy : \(database.flimsbaseFull.count)"
        print("----- MasterTableViewController ------")
    }
    
    

//    override func viewWillAppear(_ animated: true) {
//        tableView.reloadData()
//    }
    
    func readSampleData() {
        for i in 1...obrazki.count{
            typyFilmow.append((i % 2 == 0) ? TypeOfFilm.sensacja : TypeOfFilm.obyczajowy)
            cenyFilmow.append(prices[kantor.giveRandomInt(max: prices.count)])      //(i % 2 == 0) ? 72.50 : 35.20)
            opisyFilmow.append("Super Film")
            aktorzy.append("Aktorzy nieznani")
            polubienia.append(false)
        }
        polubienia[1]=true
//        polubienia[2]=true
        polubienia[5]=true
        polubienia[8]=true
        polubienia[14]=true
        polubienia[21]=true
        polubienia[35]=true
        polubienia[45]=true
        polubienia[82]=true
        polubienia[97]=true
        polubienia[109]=true
        
        typyFilmow[0] = .komedia
        typyFilmow[1] = .kryminal
        typyFilmow[2] = .dlaDzieci
        typyFilmow[3] = .familijny
        typyFilmow[4] = .dlaDzieci
        typyFilmow[5] = .kryminal
        typyFilmow[6] = .kostiumowy
        typyFilmow[7] = .autobiograficzny
        typyFilmow[8] = .obyczajowy
        typyFilmow[9] = .komedia
        typyFilmow[10] = .horror
        typyFilmow[11] = .obyczajowy
        typyFilmow[12] = .horror
        typyFilmow[13] = .kryminal
        typyFilmow[14] = .sensacja
        typyFilmow[15] = .sensacja
        typyFilmow[16] = .kryminal
        typyFilmow[17] = .kryminal
        typyFilmow[18] = .sciencefiction
        typyFilmow[19] = .fantasy
        typyFilmow[20] = .komedia
        typyFilmow[21] = .kryminal
        typyFilmow[24] = .sciencefiction
        typyFilmow[25] = .sciencefiction
        typyFilmow[26] = .sciencefiction
        typyFilmow[27] = .fantasy
        typyFilmow[38] = .dlaDzieci
        typyFilmow[42] = .muzyczny
        typyFilmow[77] = .dlaDzieci
        typyFilmow[81] = .dlaDzieci
        typyFilmow[95] = .dlaDzieci
        typyFilmow[109] = .thiler
        
        listaUlubionych = database.fillLikeList()
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
        return database.flimsbaseFull.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MasterTableViewCell

        // Configure the cell...
                let film=database.getFilm(row: indexPath.row)
                if database.flimsbaseFull.count > indexPath.row {
                    cell.titleLabel.text=film.title
                    cell.actorsLabel.text=film.actors
                    cell.typLabel.text=film.type
                    cell.priceLabel.text=String.init(format: "%6.2f", film.price)
                    cell.DVDImage.image=UIImage(data: film.filmImage! as Data)
                    cell.accessoryType = film.isLiked ? .checkmark : .none
                    cell.backgroundColor = film.isLiked ? UIColor.green : UIColor.clear
                    print("tytul=\(cell.titleLabel)")
                }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    @IBAction  func unwindBeck(segue: UIStoryboardSegue) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("----- prepare  MasterTableViewController ------")

        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
            if segue.identifier=="showDvd" {
                if let indexPath=tableView.indexPathForSelectedRow {
                    let destinatonController = segue.destination as! DetailViewController
                    
                    let rek=database.getFilm(row: indexPath.row)
                    destinatonController.dvdImageTmp   = rek.pictureName!  //filmList.giveCurrentPictureName(row: indexPath.row)
                    destinatonController.titleLabelTmp =  rek.title!
                    destinatonController.actorsLabelTmp  =  rek.actors!
                    destinatonController.typeLabelTmp  =  rek.type!
                    destinatonController.priceLabelTmp = kantor.doubleToString(rek.price)  //rek.price
                    destinatonController.youtubeUrlTmp =  rek.youtubeUrl!
                    destinatonController.descriptionLabelTmp = filmList.give(row: indexPath.row).description
                    destinatonController.currentRowTmp = indexPath.row
                }
            }
    }
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let  currCell = tableView.cellForRow(at: indexPath)
        let isChecked = currCell?.accessoryType == .checkmark
        let phisicalRow = database.getPhisicalRow(row: indexPath.row)
        
         //Social Sharing Button
         let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share", handler: { (action, indexPath) -> Void in
                    let defaultText = "Polecany  \(tytuly[indexPath.row])"
                    if let imageToShare = UIImage(named: obrazki[indexPath.row]) {
                        let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                        self.present(activityController, animated: true, completion: nil)
                    }
                })
        
        // Zaznacz button
        let checkAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Zaznacz",handler: { (action, indexPath) -> Void in
            currCell?.accessoryType = .checkmark
            currCell?.backgroundColor = UIColor.green
            database.setCheckRecord(phisicalRow: phisicalRow, value: true)
            database.saveDatabase()
            filmList.setIsLike(row: phisicalRow, isLike: true)
        })
        
        // Odznacz button
        let unCheckAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Odznacz",handler: { (action, indexPath) -> Void in
            currCell?.accessoryType = .none
            currCell?.backgroundColor = UIColor.clear
            database.setCheckRecord(phisicalRow: phisicalRow, value: false)
            database.saveDatabase()
            filmList.setIsLike(row: phisicalRow, isLike: false)
        })
        
        //shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
        checkAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
        unCheckAction.backgroundColor = UIColor.lightGray
        shareAction.backgroundColor = UIColor.blue
        
        return isChecked ? [shareAction, unCheckAction] : [shareAction, checkAction]
    }


    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Usuń"
    }
}
