//
//  HouseTests.swift
//  WesterosTests
//
//  Created by Juan Foncuberta on 8/2/18.
//  Copyright © 2018 Juan Foncuberta. All rights reserved.
//

import XCTest
@testable import Westeros
class HouseTests: XCTestCase {
    
    var starkSigil:Sigil!
    var lannisterSigil:Sigil!
    var starkHouse:House!
    var lannisterHouse:House!
    
    var robb: Person!
    var aria:Person!
    var tyrion:Person!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        
        lannisterSigil = Sigil(image:UIImage(),description:"Leon Rampante")
        lannisterHouse = House(name:"Lannister",sigil:lannisterSigil,words:"Un Lannister siempre paga sus deudas", url: URL(string:"http://awoiaf.westeros.org/index.php/House_Lannister")!)
         starkSigil = Sigil(image:UIImage(),description:"Lobo Huargo")
         starkHouse = House(name:"Stark",sigil:starkSigil,words:"Se acerca el invierno",url: URL(string:"http://awoiaf.westeros.org/index.php/House_Stark")!)
        
      
        tyrion = Person(name:"Tyrion",alias:"El enano",house:lannisterHouse);
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHouseExistence(){
        
        XCTAssertNotNil(starkHouse);
         XCTAssertNotNil(lannisterHouse);
    
    }
    
    
    func testSigilExistence(){
       
        XCTAssertNotNil(starkSigil);
        XCTAssertNotNil(lannisterSigil);
    }
    
    func testPersonExistence(){
        robb = Person(name:"Robb",alias:"El Joven Lobo",house:starkHouse);
        aria = Person(name:"Aria",house:starkHouse);
        XCTAssertNotNil(robb)
        XCTAssertEqual(aria.house.name, starkHouse.name)
        
//        XCTAssertEqual(starkHouse.count, 0)
//        starkHouse.add(person:robb);
       
//        starkHouse.add(person:robb);
//        XCTAssertEqual(starkHouse.count, 1)
//        starkHouse.add(person:aria);
//        XCTAssertEqual(starkHouse.count, 2)
//        starkHouse.add(person:tyrion);
        XCTAssertEqual(starkHouse.count, 2)
        
        let cersei = Person(name:"Cersei",house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "El matareyes", house: lannisterHouse)
        
//        lannisterHouse.add(persons: cersei, jaime)
        XCTAssertEqual(lannisterHouse.count, 3)
        
        
    }
    
    func testHouseEquality(){
        //Identidad
        XCTAssertEqual(starkHouse, starkHouse);
        
        //Igualdad
        let jinxed = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno",url: URL(string:"http://awoiaf.westeros.org/index.php/House_Lannister")!);
       
        print("-----------PRUEBAAAA-------------")
        print(jinxed.count)
        print(starkHouse.count)
        XCTAssertEqual(jinxed, starkHouse)
        
        //Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse);
    }
    
    func testHashable(){
        XCTAssertNotNil(starkHouse.hashValue)
    }
    
    func testHouseComparison(){
        XCTAssertLessThan(lannisterHouse, starkHouse)
    }
    
    
    func testHouseReturnsSortedArrayOfMembers(){
//        starkHouse.add(persons: robb,aria)
        robb = Person(name:"Robb",alias:"El Joven Lobo",house:starkHouse);
        aria = Person(name:"Aria",house:starkHouse);
        XCTAssertEqual(starkHouse.sortedMembers, [aria,robb])
        
    }
    
    
    
    
    
}
