//
//  RepositoryTest.swift
//  WesterosTests
//
//  Created by Juan Foncuberta on 13/2/18.
//  Copyright © 2018 Juan Foncuberta. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTest: XCTestCase {
    
    var localHouse: [House]!
    override func setUp() {
        super.setUp()
        localHouse = Repository.local.houses
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocalRepositoryCreation(){
        let local = Repository.local
        XCTAssertNotNil(local)
        
    }
    
    func testLocalRepositoryHousesCreation(){
       
        XCTAssertNotNil(localHouse)
        XCTAssertEqual(localHouse.count, 3)
    }
    
    func testLocalRepositoryReturnSortedArrayOfHouses(){
        XCTAssertEqual(localHouse, localHouse.sorted())
    }
    
    func testLocalRepositoryReturnHousesByCaseInsensitively(){
        let stark = Repository.local.house(named:"sTark");
        XCTAssertEqual(stark?.name, "Stark")
    
        let keepcoding = Repository.local.house(named: "Keepcoding");
        XCTAssertNil(keepcoding);
    }
    
    func testHouseFiltering(){
    
        let filtered = Repository.local.houses(filteredBy: { $0.count == 1 })
        XCTAssertEqual(filtered.count, 1)
    }
    
}
