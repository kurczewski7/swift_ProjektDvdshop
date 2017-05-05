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
    var likedList: [Bool]
    
    

    init(filmsName: [String], titles: [String], actorsList: [String], typeList: [TypeOfFilm], descriptions: [String], priceList: [Double], likedList: [Bool]) {
        
        film=Film()
        
        self.filmsName=filmsName
        self.titles=titles
        self.actorsList=actorsList
        self.typeList=typeList
        self.descriptions=descriptions
        self.priceList=priceList
        self.likedList=likedList
    }
    public mutating func give(row: Int) -> (filmId: String, title: String, actors: String, type: String, description: String, price: String, filmImage: UIImage, isLiked: Bool) {
        
        print("row=\(row)")
        
         film.fill(pictureName: filmsName[row], titleName: titles[row], price: priceList[row], type: typeList[row], filmDescription: descriptions[row], actor: actorsList[row], isLiked: likedList[row])
        //self.film.fill(pictureName: filmsName[row], titleName: titles[row], price: priceList[row], type: .muzyczny, filmDescription: "Beznadziejny", actor: "Bruce", isLiked: false)
      
        return film.giveCurrentData()
    }
        func giveIcon(row: Int) -> (name: String, price: Double, isFeatured: Bool) {
            return (name: filmsName[row], price: priceList[row], isFeatured: true)
    }
    mutating func setIsLike(row: Int, isLike: Bool){
      likedList[row] = isLike
    }
    mutating func setDescriptionList(descriptions: [String]){
        self.descriptions=descriptions
    }


    
    
}

