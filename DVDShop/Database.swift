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
        print("-----------")
        print("Ilość rekordów,  allRecords=\(self.policzRecords().allRecords),accesableRecords=\(self.policzRecords().accesableRecords)")
        if(policzRecords().allRecords==0) && policzRecords().accesableRecords==0
        {
            print("Dodanie rekordów,  allRecords=\(policzRecords().allRecords),accesableRecords=\(policzRecords().accesableRecords)")
            addDataToBase()
            
        }
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
        
        let image = UIImage(named: rek.filmId)
        let imgData = UIImageJPEGRepresentation(image!, 1)
        dbRow.filmImage=imgData! as NSData
        
        print("tytul=\(rek.title),\(rek.filmId)")
        do { try self.managedContext.save()
            print("-----Dane zapisano-----")
        } catch {   print("!!!!!!    Nie mogę zapisać danych \(error.localizedDescription)")  }
    }

    func addDataToBase()
    {
        var currentFilm: UserRekord
        for i in 0..<obrazki.count
        {
            
            //currentFilm =  filmList.give(row: i)
            //createDatabaseRow(rek: currentFilm)
            //print("i=\(i),tytul=\(currentFilm.title),\(currentFilm.filmId)")
            
            currentFilm.title = tytuly[i]
            currentFilm.actors = ""
            currentFilm.description = "Co tam"
            currentFilm.filmDirector = "Machulski"
            currentFilm.filmId = obrazki[i]
            currentFilm.filmImage = UIImage(named: obrazki[i])!
            currentFilm.isLiked = true
            currentFilm.price = "33.33"
            currentFilm.type = TypeOfFilm.fantasy.rawValue
            currentFilm.youtubeUrl = "WyHv2WqkPCQ"
                
//            print("i=\(i),tytul=\(currentFilm.title),\(tytuly[i])")
            createDatabaseRow(rek: currentFilm)
        }
    }
    

    func policzRecords() -> (accesableRecords: Int, allRecords: Int)
    {
        let accesableRecords = Filmsbase.accessibilityElementCount()
        print("Liczba dostępnych rekordów w bazie \(accesableRecords)")
        let allRecords = flimsbase.count
        print("Liczba wszystkich rekordów w bazie \(allRecords)")
        return (accesableRecords: accesableRecords, allRecords:allRecords)
    }
    
    func deleteTableBase()
    {
        let fetchRequest = NSFetchRequest<Filmsbase>(entityName: DatabaseTables.fllms.rawValue)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
        
        do { try managedContext.execute(deleteRequest) }
        catch { print("Nie można zapisać danych \(error.localizedDescription)")}
    }
    
    
}
