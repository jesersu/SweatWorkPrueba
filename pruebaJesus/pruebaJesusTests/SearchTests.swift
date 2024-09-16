//
//  Searc.swift
//  pruebaJesusTests
//
//  Created by Jesus Ervin Chapi Suyo on 16/09/24.
//  Copyright © 2024 Jesus Chapi. All rights reserved.
//

import XCTest
@testable import pruebaJesus
@MainActor final class SearchTests: XCTestCase {
    
  
    @MainActor override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    @MainActor override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSingleton() throws {
        let singleton1 = MovieStore.shared
        let singleton2 = MovieStore.shared
        XCTAssertTrue(singleton1 === singleton2, "Singleton funciona")
    }
    
    func testmovieSearch()async throws {
        let movieSearchState = MovieSearchState(movieService: MovieStore.shared)
        await movieSearchState.search(query: "dead pool")
        guard let moviesCount = movieSearchState.unitTestMovies else{
            XCTFail(" fallo por que no trajo datos a una pelicula exitente")
            return
        }
        
        XCTAssertTrue(moviesCount.count > 0)
    }

}
