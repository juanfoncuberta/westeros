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
    
    
    
    var starkHouse: House!
    var starkSigil: Sigil!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        starkSigil = Sigil(image:UIImage(),description:"Lobo Huargo")
        starkHouse = House(name:"Stark",sigil:starkSigil,words:"Se acerca el invierno")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCharacterExistence(){
      
        let ned = Person(name:"Eddar",alias:"Ned",house: starkHouse)
        print(type(of: ned))
         let aria = Person(name:"Aria",house: starkHouse)
        XCTAssertNotNil(ned);
        XCTAssertNotNil(aria);
        
    }
    
}
