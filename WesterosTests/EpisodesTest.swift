//
//  EpisodesTest.swift
//  WesterosTests
//
//  Created by Juan Foncuberta on 24/2/18.
//  Copyright © 2018 Juan Foncuberta. All rights reserved.
//

import XCTest
@testable import Westeros

var firstEpisode: Episode!
var secondEpisode: Episode!

var fEpisode:Episode!

var dateFirstEpisode: Date!
var dateSecondEpisode: Date!
var inputFormatter: DateFormatter!




class EpisodesTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
         inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "dd/mm/yyyy"
        
        dateFirstEpisode = inputFormatter.date(from:"17/04/2011")
        firstEpisode = Episode(title: "Winter is coming", airDate: dateFirstEpisode!)
        
        dateSecondEpisode = inputFormatter.date(from:"01/04/2012")
        secondEpisode = Episode(title: "The North Remembers", airDate: dateSecondEpisode!)
        
        
         fEpisode = Episode(title: "Winter is coming", airDate: dateFirstEpisode!)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSeasonExistence(){
      
        
        XCTAssertNotNil(firstEpisode)
    }
    
    
    func testEpisodeEquality(){
        XCTAssertEqual(firstEpisode, firstEpisode)
        XCTAssertNotEqual(firstEpisode, secondEpisode)
        XCTAssertEqual(firstEpisode, fEpisode)
        
    }
    
    func testEpisodeHashable(){
        XCTAssertNotNil(firstEpisode.hashValue)
    }
    func testEpisodeComparison(){
        XCTAssertLessThan(firstEpisode!, secondEpisode!)
    }
    func testEpisodeCustomStringConvertible(){
        XCTAssertEqual(firstEpisode.description, fEpisode.description)
    }
    
    
}
