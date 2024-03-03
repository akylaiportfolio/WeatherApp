//
//  SplashPresenter.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 29/2/24.
//

import Foundation

protocol SplashDelegate: AnyObject {
    func navigateToMain()
    
    func navigateToCities()
}

class SplashPresenter {
 
    private weak var delegate: SplashDelegate? = nil
    
    private var repository: SplashRepository
    
    init(delegate: SplashDelegate? = nil, repository: SplashRepository) {
        self.delegate = delegate
        self.repository = repository
    }
    
    func checkNavigate() {
        if repository.isEmptyCities() {
            delegate?.navigateToCities()
        } else {
            delegate?.navigateToMain()
        }
    }
}
