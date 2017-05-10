//
//  Database.swift
//  DVDShop
//
//  Created by Slawek Kurczewski on 06.05.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import UIKit
import CoreData
var exercises = [Filmsbase]()
class Database {
    // bufor wyjściowy tabeli danych Filmsbase
    var isFilterOn: Bool = true
    var isAscending: Bool = true
    var flimsbaseFull = [Filmsbase]()
    var filmsbaseFilter: [Int]=[0,1,2,3,4,5,6,109]
    var liczbaRekordow: (accesableRecords: Int, allRecords:Int)=(0,0)
    var managedContext: NSManagedObjectContext! = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var fetchRequest: NSFetchRequest<Filmsbase> = Filmsbase.fetchRequest()
    let sortDescriptor = NSSortDescriptor(key: "title", ascending: false)
    var filmCount: Int
    {
        get { return isFilterOn ? filmsbaseFilter.count: flimsbaseFull.count }
        
    }
   //var fullFllmbase=[Filmsbase]()
    //  let fetchRequest = NSFetchRequest<Filmsbase>(entityName: "Filmsbase")
    //    var fieldSort = "title"
    
    init(){
        print("Ilość rekordów,  allRecords=\(policzRecords().allRecords),accesableRecords=\(policzRecords().accesableRecords)")
        if(policzRecords().allRecords==0) && policzRecords().accesableRecords==0
        {
            print("Dodanie rekordów,  allRecords=\(policzRecords().allRecords),accesableRecords=\(policzRecords().accesableRecords)")
            //addDataToBase()
        }
        loadData()
    }
    func loadData(){
        print("loadData")
//        let fetchRequest: NSFetchRequest<Filmsbase> = Filmsbase.fetchRequest()
        do {            flimsbaseFull = try managedContext.fetch(fetchRequest)
        } catch {       print("Nie można załadować danych \(error.localizedDescription)")    }
    
    }
    func createDatabaseRow(rek:  UserRekord)
    {
        let dbRow = Filmsbase(context: managedContext)
        //let priceInt=kantor.
        dbRow.title = rek.title
        dbRow.price = kantor.stringToDouble(value: rek.price)
        dbRow.actors = rek.actors
        dbRow.filmDirector = rek.filmDirector
        dbRow.filmDescription = rek.description
        dbRow.type = rek.type
        dbRow.youtubeUrl = rek.youtubeUrl
        dbRow.filmId = rek.filmId
        dbRow.pictureName = rek.filmId
        dbRow.isLiked = rek.isLiked
        print("rek.filmId:\(rek.filmId)")
        
        //let image = UIImage(named: rek.filmId)
        
        let image = rek.filmImage
        let imgData = UIImageJPEGRepresentation(image, 1)
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
            let dane = filmList.give(row: i)
            
            currentFilm.title           = dane.title
            currentFilm.actors          = dane.actors
            currentFilm.description     = dane.description
            currentFilm.filmDirector    = dane.filmDirector
            currentFilm.filmId          = dane.filmId
            currentFilm.filmImage       = dane.filmImage
            currentFilm.isLiked         = dane.isLiked
            currentFilm.price           = dane.price
            currentFilm.type            = dane.type
            currentFilm.youtubeUrl      = dane.youtubeUrl    //"WyHv2WqkPCQ"
        
            print("i=\(i),tytul=\(currentFilm.title),\(tytuly[i])")
            createDatabaseRow(rek: currentFilm)
        }
    }
    
    func policzRecords() -> (accesableRecords: Int, allRecords: Int)
    {
        let accesableRecords = Filmsbase.accessibilityElementCount()
        print("Liczba dostępnych rekordów w bazie \(accesableRecords)")
        let allRecords = ( isFilterOn ? filmsbaseFilter.count: flimsbaseFull.count)
        print("Liczba wszystkich rekordów w bazie \(allRecords)")
        liczbaRekordow.allRecords=allRecords
        liczbaRekordow.accesableRecords=accesableRecords
        return (accesableRecords: accesableRecords, allRecords:allRecords)
    }
    
    func deleteTableBase()
    {
//        let fetchRequest = NSFetchRequest<Filmsbase>(entityName: DatabaseTables.fllms.rawValue)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
        
        do { try managedContext.execute(deleteRequest) }
        catch { print("Nie można zapisać danych \(error.localizedDescription)")}
    }
    func setupDataFromAssets()    {
        let liczba=policzRecords()
        if liczba.allRecords == 0 {
            addDataToBase()        }
    }
    func setupDataFromInternet()
    {
        // funkcja rozwojowa
    }
    func getFilm(row: Int) -> Filmsbase{
        return  flimsbaseFull[(isFilterOn == false) ?row: filmsbaseFilter[row] ]
    }
    func fetchFilmbase(){
        
    }
    func fillFilterData(field: TypeFilterFields, seekValue: String){
 //       let currentFilm : Filmsbase? = nil
        

        isFilterOn=true
        filmsbaseFilter.removeAll()
        
        let start=0
        let end=flimsbaseFull.count
        var pos=0
        
        for i in start..<end {
            pos = isAscending ? i : end-i-1
            if checkFilm(currentFilm: flimsbaseFull[pos], field: field, seekValue: seekValue) {
                 filmsbaseFilter.append(pos)
                 print("---Dodano \(pos), obecnie filmsbaseFilter.count=\(filmsbaseFilter.count)")
            }
        }
        
        for i in 1..<filmsbaseFilter.count {
            print("\(i)  \(filmsbaseFilter[i])  \(flimsbaseFull[filmsbaseFilter[i]].title ?? "brak")  \(flimsbaseFull[filmsbaseFilter[i]].type ?? "brak")  \(flimsbaseFull[filmsbaseFilter[i]].actors ?? "brak")")
        }
    }

    func getPhisicalRow(row: Int) -> Int{
        return isFilterOn ? filmsbaseFilter[row] : row
    }
    func getImageDataFromDb(phisicalRow: Int) -> Data {
        return flimsbaseFull[phisicalRow].filmImage! as Data
    }
    func checkFilm(currentFilm: Filmsbase, field: TypeFilterFields, seekValue: String) -> Bool{
        var warunek:Bool = false
        switch field {
            case .tytul  : warunek = kantor.isInString(currentFilm.title!,  seekValue: seekValue)
            case .aktorzy: warunek = kantor.isInString(currentFilm.actors!, seekValue: seekValue)
            case .gatunek: warunek = kantor.isInString(currentFilm.type!,   seekValue: seekValue)
            case .cenaDo : warunek = currentFilm.price <= kantor.stringToDouble(value: seekValue)
        }
        return  warunek
    }
    
    func setFilter(field: TypeFilterFields, seekValue: String){
    }
//        fetchRequest.sortDescriptors=[sortDescriptor]
//        fetchRequest.predicate = NSPredicate(format: "title == %@", seekValue)
//        loadData()
//------------------------
        
    

    func feachExercises(){
        let fetchRequest=NSFetchRequest<NSFetchRequestResult>(entityName: "Filmsbase")
        let sortDescriptor=NSSortDescriptor(key: "title", ascending: false)
        fetchRequest.sortDescriptors=[sortDescriptor]
    }
}
        //let x= NSFRCfiltr
        
//        do { try let  bmanagedContext;.execute(fetchRequest)
//        
//        }
//        catch { print("Nie można zapisać danych \(error.localizedDescription)")}

//        let fetchResult: [Filmsbase] = managedContext.execute(fetchRequest) as [Filmsbase]
//         flimsbase = fetchResult
        
//            do { try managedContext.execute(deleteRequest) }
//            catch { print("Nie można zapisać danych \(error.localizedDescription)")}

        
        
//        switch field {
//            case .tytul:
//            case .aktorzy:
//            case .gatunek:
//            case .cenaDo:
//            default:
//        }
    
