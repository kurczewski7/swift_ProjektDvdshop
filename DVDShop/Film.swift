//
//  Film.swift
//  DVDShop
//
//  Created by Slawek Kurczewski on 29.04.2017.
//  Copyright © 2017 Slawomir Kurczewski. All rights reserved.
//

import UIKit
struct Film {
    var filmId = ""
    var title = ""
    var actors = ""
    var type : TypeOfFilm = .obyczajowy
    var type_str=""
    var description = ""
    var price: Double = 0.0
    var price_str = ""
    var filmImage:UIImage?
    var isLiked = false
    
    init(){
        
    }
    
    init(filmId: String, title: String, actors: String, type: TypeOfFilm, description: String, price: Double, filmImage: UIImage!, isLiked: Bool){
        self.filmId=filmId
        self.title=title
        self.actors=actors
        self.type=type
        self.description=description
        self.price=price
        self.price_str = String(format: "%6.2f",  price)
        self.filmImage=filmImage
        self.isLiked=isLiked
    }
    init(pictureName: String, titleName: String, price: Double){
        
        self.title=titleName
        self.actors = "Ronald Regan"
        self.type = .obyczajowy
        self.description = "Ciekawy film"
        self.price = price
        self.price_str = String(format: "%6.2f",  price)
        self.filmImage = UIImage(named: pictureName)
        self.isLiked = true
        
        let index=(pictureName.index(pictureName.endIndex, offsetBy: -8))
        self.filmId = pictureName.substring(from: index)
        }
    
    public mutating func fill(pictureName: String, titleName: String, price: Double, type: TypeOfFilm, filmDescription: String, actor: String, isLiked: Bool ){
        
        self.title = titleName
        self.actors = actor
        self.type = .obyczajowy
        self.description = filmDescription
        self.price = price
        self.price_str = String(format: "%6.2f",  price)
        self.filmImage =  UIImage(named: pictureName)
        self.isLiked = isLiked
        
        let index=(pictureName.index(pictureName.endIndex, offsetBy: -8))
        self.filmId = pictureName.substring(from: index)
    }
    
    
    func giveCurrentData() -> (filmId: String, title: String, actors: String, type: String, description: String, price: String, filmImage: UIImage, isLiked: Bool){
        var type_str: String
        
        switch type {
        case .komedia:    type_str = "Komedia"
        case .horror:     type_str = "Horror"
        case .sensacja:   type_str = "Sensacja"
        case .kostiumowy: type_str = "Kostiumowy"
        case .wojenny:    type_str = "Wojenny"
        case .obyczajowy: type_str = "obyczajowy"
        case .dlaDzieci:  type_str = "Dla dzieci"
        case .muzyczny:   type_str = "Muzyczny"
        }
        print("----------------")
        print("filmId=\(filmId)")
        print("title=\(title)")
        print("actors=\(actors)")
        print("type=\(type)")
        print("description=\(description)")
        print("price=\(price)")
        print(isLiked ? "isLiked=true": "isLiked=false")
        print("-")
        
     return (filmId: self.filmId, title: self.title, actors: self.actors, type: type_str, description: self.description, price: price_str, filmImage: self.filmImage!, isLiked: self.isLiked)
    }
    
    
}
