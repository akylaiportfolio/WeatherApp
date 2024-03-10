//
//  CitiesEditPresenterTest.swift
//  WeatherAppTests
//
//  Created by Акылай Бекболсунова on 11/3/24.
//

import XCTest

final class CitiesEditPresenterTest: XCTestCase {

    func testCountCityFull() throws {
        let logger = CitiesEditDelegateLogger()
        
        let mockRepository = CitiesEditMockRepository(
            mock: [
                SearchModel(
                    name: "Bishkek", lat: 12.32, lon: 12.54,
                    country: "KG"
                ),
                SearchModel(
                    name: "Osh", lat: 14.32, lon: -17.54,
                    country: "KG"
                ),
                SearchModel(
                    name: "Talas", lat: 52.32, lon: 62.54,
                    country: "KG"
                ),
            ]
        )
        let presenter = CitiesEditPresenter(delegate: logger, repository: mockRepository)
        
        XCTAssertEqual(presenter.countCity(), 3)
    }
    
    func testCountCityEmpty() throws {
        let logger = CitiesEditDelegateLogger()
        
        let mockRepository = CitiesEditMockRepository(mock: [])
        let presenter = CitiesEditPresenter(delegate: logger, repository: mockRepository)
        
        XCTAssertEqual(presenter.countCity(), 0)
    }
                                                    
    func testShowSaveEmpty() throws {
        let logger = CitiesEditDelegateLogger()
        
        let mockRepository = CitiesEditMockRepository(mock: [])
        let presenter = CitiesEditPresenter(delegate: logger, repository: mockRepository)
        
        presenter.showSave()
                                                      
        XCTAssertEqual(logger.modelsLog?.count, 0)
    }
    
    func testShowSaveFull() throws {
        let logger = CitiesEditDelegateLogger()
        
        let mockRepository = CitiesEditMockRepository(
            mock: [
                SearchModel(
                    name: "Bishkek", lat: 12.32, lon: 12.54,
                    country: "KG"
                ),
                SearchModel(
                    name: "Osh", lat: 14.32, lon: -17.54,
                    country: "KG"
                ),
                SearchModel(
                    name: "Talas", lat: 52.32, lon: 62.54,
                    country: "KG"
                ),
            ]
        )
        let presenter = CitiesEditPresenter(delegate: logger, repository: mockRepository)
        
        presenter.showSave()
                                                      
        XCTAssertEqual(logger.modelsLog?.count, 3)
    }
    
    func testRemove() throws {
        let logger = CitiesEditDelegateLogger()
        
        let mockRepository = CitiesEditMockRepository(
            mock: [
                SearchModel(
                    name: "Bishkek", lat: 12.32, lon: 12.54,
                    country: "KG"
                ),
                SearchModel(
                    name: "Osh", lat: 14.32, lon: -17.54,
                    country: "KG"
                ),
                SearchModel(
                    name: "Talas", lat: 52.32, lon: 62.54,
                    country: "KG"
                ),
            ]
        )
        let presenter = CitiesEditPresenter(delegate: logger, repository: mockRepository)
        
        presenter.remove(
            SearchModel(
                name: "Osh", lat: 14.32, lon: -17.54,
                country: "KG"
            )
        )
        
        presenter.showSave()
                                                      
        XCTAssertEqual(logger.modelsLog?.count, 2)
    }
}
