//
//  SplashDelegateLogger.swift
//  WeatherAppTests
//
//  Created by Акылай Бекболсунова on 11/3/24.
//

import Foundation

class SplashDelegateLogger: SplashDelegate {
    
    var navigateToMainCalled = false
    var navigateToCitiesCalled = false
    
    func navigateToMain() {
        navigateToMainCalled = true
    }
    
    func navigateToCities() {
        navigateToCitiesCalled = true
    }
}
