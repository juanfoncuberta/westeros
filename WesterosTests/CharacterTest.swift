//
//  CharacterTest.swift
//  WesterosTests
//
//  Created by Juan Foncuberta on 9/2/18.
//  Copyright © 2018 Juan Foncuberta. All rights reserved.
//

import XCTest
@testable import Westeros
class CharacterTest: XCTestCase {
    
    var starkSigil:Sigil!
    var lannisterSigil:Sigil!
    var starkHouse:House!
    var lannisterHouse:House!
    
    var robb: Person!
    var aria:Person!
    var tyrion:Person!
    
   // var starkHouse: House!
    //var starkSigil: Sigil!
    //var ned: Person!
    //var aria: Person!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        lannisterSigil = Sigil(image:UIImage(),description:"Leon Rampante")
        lannisterHouse = House(name:"Lannister",sigil:lannisterSigil,words:"Un Lannister siempre paga sus deudas",url: URL(string:"http://awoiaf.westeros.org/index.php/House_Lannister")!)
        starkSigil = Sigil(image:UIImage(),description:"Lobo Huargo")
        starkHouse = House(name:"Stark",sigil:starkSigil,words:"Se acerca el invierno",url: URL(string:"http://awoiaf.westeros.org/index.php/House_Lannister")!)
        
        robb = Person(name:"Robb",alias:"El Joven Lobo",house:starkHouse);
        aria = Person(name:"Aria",house:starkHouse);
        tyrion = Person(name:"Tyrion",alias:"El enano",house:lannisterHouse);
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCharacterExistence(){
      
       
        XCTAssertNotNil(robb);
        XCTAssertNotNil(aria);
        
    }
    func testFullName(){
        XCTAssertEqual(robb.fullName, "Robb Stark")
    }
 
    func testPersonEquality(){
        //Identidad
        XCTAssertEqual(tyrion, tyrion);
        
        //Igualdad
        let enano = Person(name: "Tyrion", alias: "El enano", house: lannisterHouse)
        XCTAssertEqual(enano, tyrion);
        
        //Desigualdad
        XCTAssertNotEqual(tyrion, aria);
    }
    
}
