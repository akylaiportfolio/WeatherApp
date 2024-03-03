//
//  CitiesPresenter.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 29/2/24.
//

import Foundation

protocol CitiesEditDelegate: AnyObject {
    func showSaveCitys(models: [SearchModel])
}

class CitiesEditPresenter {
    
    private weak var delegate: CitiesEditDelegate? = nil
    
    private var repository: CitiesEditRepository
    
    init(delegate: CitiesEditDelegate? = nil, repository: CitiesEditRepository) {
        self.delegate = delegate
        self.repository = repository
    }
    
    func countCity() -> Int {
        return repository.getSave().count
    }
    
    func showSave() {
        delegate?.showSaveCitys(models: repository.getSave())
    }
    
    func remove(_ model: SearchModel) {
        repository.removeCity(model)
        
        delegate?.showSaveCitys(models: repository.getSave())
    }
}
