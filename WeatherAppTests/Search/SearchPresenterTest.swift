//
//  SearchPresenterTest.swift
//  WeatherAppTests
//
//  Created by Акылай Бекболсунова on 11/3/24.
//

import XCTest

final class SearchPresenterTest: XCTestCase {

    func testSearchNotResult() throws {
        let logger = SearchDelegateLogger()
        let mockRepository = SearchMockRepository()
        
        let presenter = SearchPresenter(delegate: logger, repository: mockRepository)
        
        presenter.search(name: "Test not result")
        
        XCTAssertEqual(logger.showResultSearchLog?.count, 0)
    }
    
    func testSearchFullResult() throws {
        let logger = SearchDelegateLogger()
        let mockRepository = SearchMockRepository()
        
        let presenter = SearchPresenter(delegate: logger, repository: mockRepository)
        
        presenter.search(name: "Bish")
        
        XCTAssertEqual(logger.showResultSearchLog?.count, 6)
    }

    
    func testTetPopular() throws {
        let logger = SearchDelegateLogger()
        let mockRepository = SearchMockRepository()
        
        let presenter = SearchPresenter(delegate: logger, repository: mockRepository)
        
        presenter.getPopular()
        
        XCTAssertEqual(logger.showPopularLog?.count, 3)
    }
    
    func testSave() throws {
        let logger = SearchDelegateLogger()
        let mockRepository = SearchMockRepository()
        
        let presenter = SearchPresenter(delegate: logger, repository: mockRepository)
        
        presenter.save(SearchModel(name: "Bish", lat: 1, lon: 2, country: "KG"))
        
        XCTAssertEqual(mockRepository.saveModel[0].name, "Bish")
    }

}
