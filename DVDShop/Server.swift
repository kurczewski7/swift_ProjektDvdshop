//
//  Server.swift
//  DVDShop
//
//  Created by Slawek Kurczewski on 16.05.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import Foundation
class Server {
    
    var urlString: String = ""
    var url: URL? = nil
    var urlRequest:URLRequest? = nil
    var task: URLSession? = nil
    var dvds = [Dvd]()
    //
    // http://skurczewski1.myqnapcloud.com/dvdshop/api.php/dvds
    // http://skurczewski1.myqnapcloud.com/dvdshop/dvds.json
    // https://api.kivaws.org/v1/loans/newest.json
    // http://www.learnswiftonline.com/Samples/subway.json
    init() {
        self.urlString = "http://skurczewski1.myqnapcloud.com/dvdshop/dvds.json"
        getLatestDvds()
    }
    
    func getLatestDvds() {
        
        guard let url = URL(string: urlString) else {
            return        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request, completionHandler:
        { (data, response, error) -> Void in
            print("url:\(self.urlString)")
            if let error = error {
                print(error)
                return   }
            // Parse JSON data
            if let data = data {
                self.dvds = self.parseJsonData(data: data)
                }
            }
        )
    task.resume()
    }


    func parseJsonData(data: Data) -> [Dvd] {
           var dvds = [Dvd]()
           do {
                 let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                    
            // Parse JSON data
            let xx=jsonResult?.count
            let yy = jsonResult?.description
            print("jsonResult=\(String(describing: jsonResult))")
            print("xx=\(String(describing: xx))")
            print("yy=\(String(describing: yy))")

                    let jsonDvds = jsonResult?["dvds"] as! [AnyObject]
                    for jsonDvd in jsonDvds {
                        let dvd = Dvd()
                        print("t:\(dvd.title)", "a:\(dvd.actors)","y:\(dvd.youtubeUrl)",jsonDvd.absoluteString)
                        dvds.append(dvd)
                    }
                } catch {    print(error)     }
        return dvds
     }
    
    func makeJsonTxt(database db : Database) -> String {
        var tekst: String = ""
        var tx: [String] = ["","","","","","","","","","",""]
        let brak = "brak"
        
        tekst =  "{ \"dvds\" : ["
        for i in 0..<db.flimsbaseFull.count  {
            tx[0] = "  {\"filmId\":\"\(db.flimsbaseFull[i].filmId ??  brak)\""
            tx[1] = ", \"title\":\"\(db.flimsbaseFull[i].title ?? "")\""
            tx[2] = ", \"filmDirector\":\"\(db.flimsbaseFull[i].filmDirector ?? "")\""
            tx[3] = ", \"actors\":\"\(db.flimsbaseFull[i].actors ?? "")\""
            tx[4] = ", \"type\":\"\(db.flimsbaseFull[i].type ?? "")\""
            tx[5] = ", \"filmDescription\":\"\(db.flimsbaseFull[i].filmDescription ?? "")\""
            tx[6] = ", \"filmImageName\":\"\(db.flimsbaseFull[i].pictureName ?? "")\""
            tx[7] = ", \"youtubeUrl\":\"\(db.flimsbaseFull[i].youtubeUrl ?? "")\""
            tx[8] = ", \"price\":\"\(db.flimsbaseFull[i].price )\""
            tx[9] = ", \"isLiked\":\"\(db.flimsbaseFull[i].isLiked ? "1" : "0")\"}"
            tx[10] = (i < db.flimsbaseFull.count-1) ? ",  \n " : " \n"
            for t in 0..<tx.count {
                tekst += tx[t]
            }
        }
        tekst += "]}"
        return tekst
    }
}
