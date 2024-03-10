//
//  SplashPresenterTest.swift
//  WeatherAppTests
//
//  Created by Акылай Бекболсунова on 11/3/24.
//

import XCTest

final class SplashPresenterTest: XCTestCase {

    func testNavigateToMain() throws {
        let logger = SplashDelegateLogger()
        let mockRepository = SplashMockRepository(isEmptyCitiesMock: false)
        
        let presenter = SplashPresenter(delegate: logger, repository: mockRepository)
        
        presenter.checkNavigate()
        
        XCTAssertEqual(logger.navigateToMainCalled, true)
        XCTAssertEqual(logger.navigateToCitiesCalled, false)
    }
    
    func testNavigateToCities() throws {
        let logger = SplashDelegateLogger()
        let mockRepository = SplashMockRepository(isEmptyCitiesMock: true)
        
        let presenter = SplashPresenter(delegate: logger, repository: mockRepository)
        
        presenter.checkNavigate()
        
        XCTAssertEqual(logger.navigateToMainCalled, false)
        XCTAssertEqual(logger.navigateToCitiesCalled, true)
    }
}
