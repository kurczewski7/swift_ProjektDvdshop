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
    var type = ""
    var description = ""
    var price: Double = 0.0
    var price_str = ""
    var filmImage:UIImage?
    var isLiked = false
    
    init(filmId: String, title: String, actors: String, type: String, description: String, price: Double, filmImage: UIImage!, isLiked: Bool){
        self.filmId=filmId
        self.title=title
        self.actors=actors
        self.type=type
        self.description=description
        self.price_str = String(format: "%6.2f",  price)
        self.price=price
        self.filmImage=filmImage
        self.isLiked=isLiked
    }
    init(pictureName: String, titleName: String, price: Double){
        
        self.title=titleName
        self.actors = "Ronald Regan"
        self.type = "Komedia"
        self.description = "Ciekawy film"
        self.price = price
        self.filmImage = UIImage(named: pictureName)
        self.isLiked = true
        
        }
    
    
}
