//
//  FilmList.swift
//  DVDShop
//
//  Created by Slawek Kurczewski on 02.05.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import UIKit

struct FilmList {
    var film: Film
    var filmsName: [String]
    var titles: [String]
    var actorsList: [String]
    var typeList: [TypeOfFilm]
    var descriptions: [String]
    var priceList: [Double]
    var youtubeUrlList: [String]
    var likedList: [Bool]
    var defaultYoutubeUrls: [String] = ["7ynBUJPNEdM",  "WyHv2WqkPCQ","WlYC8gDvutc","WyHv2WqkPCQ"]
    

    init(filmsName: [String], titles: [String], actorsList: [String], typeList: [TypeOfFilm], descriptions: [String], priceList: [Double],  youtubeUrlList : [String], likedList: [Bool]) {
        
        film=Film()
        
        self.filmsName=filmsName
        self.titles=titles
        self.actorsList=actorsList
        self.typeList=typeList
        self.descriptions=descriptions
        self.priceList=priceList
        self.likedList=likedList
        self.youtubeUrlList=youtubeUrlList
    
    }
    public mutating func give(row: Int) ->  (filmId: String, title: String, actors: String, filmDirector: String,  type: String, description: String, price: String, filmImage: UIImage, youtubeUrl: String, isLiked: Bool) {
        
        print("row=\(row)")
        
        
        film.fill(pictureName: filmsName[row], titleName: titles[row], price: priceList[row], type: typeList[row], filmDescription: descriptions[row], actor: actorsList[row], filmDirector: "brak", youtubeUrl: giveYoutubeUrl(row: row), isLiked: likedList[row])
      
      
        return film.giveCurrentData()    }
    
    func giveIcon(row: Int) -> (name: String, price: Double, isFeatured: Bool) {
            return (name: filmsName[row], price: priceList[row], isFeatured: true)
    }
    
    mutating func setIsLike(row: Int, isLike: Bool){
      likedList[row] = isLike
    }
    
    func giveYoutubeUrl(row: Int) -> String{
        if row < youtubeUrlList.count {
            return youtubeUrlList[row]
        }
        else
        {
            let randomValue=Int(arc4random_uniform(UInt32(defaultYoutubeUrls.count)))
            return defaultYoutubeUrls[randomValue]
        }
    }
    func giveCurrentPictureName(row: Int) -> String {        
        return filmsName[row]
    }

    
    
    
    
    
//    mutating func setDescriptionList(descriptions: [String]){
//        self.descriptions=descriptions
//    }
//          value=defaultYoutubeUrls[randomElem]
//        }
//        return value
//    }


    
    
}

