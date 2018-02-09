//
//  House.swift
//  Westeros
//
//  Created by Juan Foncuberta on 8/2/18.
//  Copyright © 2018 Juan Foncuberta. All rights reserved.
//

import UIKit


typealias Words = String

final class House{
    let name: String
    let sigil: Sigil
    let words: Words

    init(name:String,sigil:Sigil,words:Words){
        self.name = name
        self.sigil = sigil
        self.words = words
        
    }
}


final class Sigil{
    let description: String
    let image: UIImage
    
    init(image:UIImage, description:String){
        self.image = image
        self.description = description
    }
    
}
