//
//  ViewController.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 27/2/24.
//

import UIKit

class SearchController: BaseViewController {
    
    public var presenter: SearchPresenter?
    
    private lazy var toolbar = SearchToolbar()
    
    private lazy var searchField = SearchField()
    
    private lazy var popularCities = PopularCitiesView()
    
    private lazy var citiesList = CitiesListView()

    override func setupController() {
        view.addGradient(
            start: .init(hex: "#7EA9E9"),
            end: .init(hex: "#131C6C")
        )
        
        toolbar.backItem.onTab { [self] in
            router?.back()
        }
        
        popularCities.select { [self] model in
            router?.back()
            
            presenter?.save(model)
        }
        
        citiesList.select { [self] model in
            router?.back()
            
            presenter?.save(model)
        }
        
        searchField.textField.change(time: 1) { [self] text in
            presenter?.search(name: text)
        }
        
        presenter?.getPopular()
    }
    
    override func setupSubViews() {
        view.addSubview(toolbar)
        toolbar.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        view.addSubview(searchField)
        searchField.snp.makeConstraints { make in
            make.top.equalTo(toolbar.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        view.addSubview(popularCities)
        popularCities.snp.makeConstraints { make in
            make.top.equalTo(searchField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        view.addSubview(citiesList)
        citiesList.snp.makeConstraints { make in
            make.top.equalTo(popularCities.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
}

extension SearchController: SearchDelegate {
    func showPopular(model: [SearchModel]) {
        popularCities.fill(model)
    }
    
    func showResultSearch(model: [SearchModel]) {
        citiesList.fill(model)
    }
}
