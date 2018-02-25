//
//  Repository.swift
//  Westeros
//
//  Created by Juan Foncuberta on 13/2/18.
//  Copyright © 2018 Juan Foncuberta. All rights reserved.
//

import Foundation


final class Repository {
    static let local = LocalFactory()
    
  
}

protocol HouseFactory {
    typealias Filter = (House) ->Bool
    var houses: [House]{ get }
    func house(named: String)->House?
    func houses(filteredBy:Filter)->[House]
}

final class LocalFactory: HouseFactory{
 
    var houses: [House]{
       //Houses creation 
        let lannisterSigil = Sigil(image:#imageLiteral(resourceName: "lannister.jpg"),description:"Leon Rampante")
        let lannisterHouse = House(name:"Lannister",sigil:lannisterSigil,words:"Un Lannister siempre paga sus deudas", url: URL(string:"https://awoiaf.westeros.org/index.php/House_Lannister")!)
        let  starkSigil = Sigil(image:#imageLiteral(resourceName: "codeIsComing.png"),description:"Lobo Huargo")
        let  starkHouse = House(name:"Stark",sigil:starkSigil,words:"Se acerca el invierno", url: URL(string:"https://awoiaf.westeros.org/index.php/House_Stark")!)
        
        let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryenSmall.jpg"), description: "Dragon tricefalo")
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y sangre", url: URL(string:"https://awoiaf.westeros.org/index.php/House_Targaryen")!)
        
        let robb = Person(name:"Robb",alias:"El Joven Lobo",house:starkHouse);
        let aria = Person(name:"Aria",house:starkHouse);
        
        let tyrion = Person(name:"Tyrion",alias:"El enano",house:lannisterHouse);
        let cersei = Person(name:"Cersei",house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "El matareyes", house: lannisterHouse)
        
        let dani = Person(name: "Daenerys", alias: "Madre de Dragones", house: targaryenHouse)
        
        
        starkHouse.add(person:aria)
        starkHouse.add(person:robb)
        
        lannisterHouse.add(person:tyrion)
        lannisterHouse.add(person:cersei)
        lannisterHouse.add(person:jaime)
        
        targaryenHouse.add(person: dani)
        
        
        return [starkHouse,lannisterHouse,targaryenHouse].sorted()
    }
    func house(named name: String) -> House? {
        //let house = houses.filter{$0.name.uppercased() == name.uppercased()}.first
        let house = houses.first{$0.name.uppercased() == name.uppercased()}
        return house
    }
    func houses(filteredBy: Filter) -> [House] {
        return houses.filter(filteredBy)
    }
    
}
