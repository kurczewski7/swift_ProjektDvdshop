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
    // http://skurczewski1.myqnapcloud.com/dvdshop/dvds.json"
    // https://api.kivaws.org/v1/loans/newest.json"
    // http://www.learnswiftonline.com/Samples/subway.json
    init(urlString: String = "") {
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

}
