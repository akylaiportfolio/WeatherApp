//
//  MainPresenterTest.swift
//  WeatherAppTests
//
//  Created by Акылай Бекболсунова on 11/3/24.
//

import XCTest

final class MainPresenterTest: XCTestCase {

    func testShowSave() throws {
        let logger = MainDelegateLogger()
        
        let mockRepository = MainMockRepository(
            mockModel: [
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
        
        let presenter = MainPresenter(delegate: logger, repository: mockRepository)
        
        presenter.showSave()
        
        XCTAssertEqual(logger.indexLog, nil)
        XCTAssertEqual(logger.modelsLog?.count, 3)
        
        logger.modelsLog?.enumerated().forEach { (index, model) in
            if index == 0 {
                XCTAssertEqual(model.name, "Bishkek")
            }
            
            if index == 1 {
                XCTAssertEqual(model.name, "Osh")
            }
            
            if index == 2 {
                XCTAssertEqual(model.name, "Talas")
            }
        }
    }
    
    func testShowSaveNil() throws {
        let logger = MainDelegateLogger()
        
        let mockRepository = MainMockRepository(mockModel: [])
        
        let presenter = MainPresenter(delegate: logger, repository: mockRepository)
        
        presenter.showSave()
        
        XCTAssertEqual(logger.indexLog, nil)
        XCTAssertEqual(logger.modelsLog?.count, 0)
    }
    
    func testSelectCityOsh() throws {
        let logger = MainDelegateLogger()
        
        let mockRepository = MainMockRepository(
            mockModel: [
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
        let presenter = MainPresenter(delegate: logger, repository: mockRepository)
        
        presenter.selectCity(
            selectCity: SearchModel(
                name: "Osh", lat: 14.32, lon: -17.54,
                country: "KG"
            )
        )
        
        presenter.showPage()
        
        XCTAssertEqual(logger.indexLog, 1)
        XCTAssertEqual(logger.modelsLog, nil)
    }
    
    func testSelectCityTalas() throws {
        let logger = MainDelegateLogger()
        
        let mockRepository = MainMockRepository(
            mockModel: [
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
        let presenter = MainPresenter(delegate: logger, repository: mockRepository)
        
        presenter.selectCity(
            selectCity: SearchModel(
                name: "Talas", lat: 14.32, lon: -17.54,
                country: "KG"
            )
        )
        
        presenter.showPage()
        
        XCTAssertEqual(logger.indexLog, 2)
        XCTAssertEqual(logger.modelsLog, nil)
    }
    
    func testSelectCityBishkek() throws {
        let logger = MainDelegateLogger()
        
        let mockRepository = MainMockRepository(
            mockModel: [
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
        let presenter = MainPresenter(delegate: logger, repository: mockRepository)
        
        presenter.selectCity(
            selectCity: SearchModel(
                name: "Bishkek", lat: 14.32, lon: -17.54,
                country: "KG"
            )
        )
        
        presenter.showPage()
        
        XCTAssertEqual(logger.indexLog, 0)
        XCTAssertEqual(logger.modelsLog, nil)
    }
}
