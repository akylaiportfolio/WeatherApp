//
//  SearchPresenter.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 29/2/24.
//

import Foundation

protocol SearchDelegate: AnyObject {
    func showResultSearch(model: [SearchModel])
    
    func showPopular(model: [SearchModel])
}

class SearchPresenter {
    
    private weak var delegate: SearchDelegate? = nil
    
    private var repository: SearchRepository
    
    init(delegate: SearchDelegate? = nil, repository: SearchRepository) {
        self.delegate = delegate
        self.repository = repository
    }
    
    func save(_ model: SearchModel) {
        if !repository.getSave().contains(where: { it in return it.name == model.name }) {
            repository.save(model)
        }
    }
    
    func getPopular() {
        delegate?.showPopular(model: repository.getPopular())
    }
    
    func search(name: String?) {
        guard let name = name else { return }
        
        repository.search(name: name) { [self] response in
            switch response {
            case .success(let model):
                delegate?.showResultSearch(model: model)
                
                break
                
            case .failure(let failure):
                print(failure.message)
                
                break
            }
        }
    }
}
