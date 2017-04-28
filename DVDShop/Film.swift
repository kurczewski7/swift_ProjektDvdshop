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
    var prise = 0
    var filmImage:UIImage?
    var isLiked = false
    
    init(filmId: String, title: String, actors: String, type: String, description: String, prise: Int, filmImage: UIImage!, isLiked: Bool){
        self.filmId=filmId
        self.title=title
        self.actors=actors
        self.type=type
        self.description=description
        self.prise=prise
        self.filmImage=filmImage
        self.isLiked=isLiked
    }
    
}
