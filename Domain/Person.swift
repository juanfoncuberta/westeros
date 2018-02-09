//
//  Person.swift
//  Westeros
//
//  Created by Juan Foncuberta on 9/2/18.
//  Copyright © 2018 Juan Foncuberta. All rights reserved.
//

import Foundation

final class Person {
    let name: String
    let house: House
    
    private let _alias: String?
    var alias: String { return _alias ?? "" }
    
    init(name: String, alias: String? = nil, house: House) {
        self.name = name
        _alias = alias
        self.house = house
    }
}
