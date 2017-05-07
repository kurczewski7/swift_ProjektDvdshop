//
//  Database.swift
//  DVDShop
//
//  Created by Slawek Kurczewski on 06.05.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import UIKit
import CoreData

class Database
{
    // bufor wyjściowy tabeli danych Filmsbase
    var flimsbase = [Filmsbase]()
    var managedContext: NSManagedObjectContext! = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    init(){
        loadData()
    }
    func loadData(){
        let fetchRequest: NSFetchRequest<Filmsbase> = Filmsbase.fetchRequest()
        do {            flimsbase = try managedContext.fetch(fetchRequest)
        } catch {       print("Nie można załadować danych \(error.localizedDescription)")    }
    
    }
    func createDatabaseRow(rek:  UserRekord)
    {
        let dbRow = Filmsbase(context: managedContext)
        let image = UIImage(named: rek.filmId)
        let imgData = UIImageJPEGRepresentation(image!, 1)
        
        dbRow.title = rek.title
        dbRow.price = Double(rek.price)!
        dbRow.actors = rek.actors
        dbRow.filmDirector = rek.filmDirector
        dbRow.filmDescription = rek.description
        dbRow.type = rek.type
        dbRow.youtubeUrl = rek.youtubeUrl
        dbRow.filmId = rek.filmId
        dbRow.pictureName = rek.filmId
        dbRow.isLiked = rek.isLiked
        
        dbRow.filmImage=imgData! as NSData
        
        do { try self.managedContext.save()
        } catch {   print("Nie mogę zapisać danych \(error.localizedDescription)")  }
    }
}
