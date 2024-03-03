//
//  MainPresenter.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 29/2/24.
//

import Foundation

protocol MainDelegate: AnyObject {
    func showSaveCitys(models: [SearchModel])

    func showPage(index: Int)
}

class MainPresenter {
    
    private weak var delegate: MainDelegate? = nil
    
    private var repository: MainRepository
    
    public lazy var selectCity: SearchModel? = nil
    
    init(delegate: MainDelegate? = nil, repository: MainRepository) {
        self.delegate = delegate
        self.repository = repository
    }
    
    func selectCity(selectCity: SearchModel?) {
        self.selectCity = selectCity
    }
    
    func showSave() {
        delegate?.showSaveCitys(models: repository.getSave())
    }
    
    func showPage() {
        if let selectCity = selectCity {
            let citis = repository.getSave()
            
            citis.enumerated().forEach { (index, item) in
                if item.name == selectCity.name {
                    delegate?.showPage(index: index)
                }
            }
        }
    }
}
