//
//  CitiesController.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 27/2/24.
//

import UIKit
import SnapKit

class CitiesEditController: BaseViewController {
    
    public var presenter: CitiesEditPresenter?
    
    private lazy var toolbar = CitiesToolbar()
    
    private lazy var citiesWeatherList = CitiesWeatherView()
    
    override func setupController() {
        view.addGradient(
            start: .init(hex: "#7EA9E9"),
            end: .init(hex: "#131C6C")
        )
        
        toolbar.leftItem.onTab { [self] in
            router?.open(SearchBuilder.create())
        }
        
        toolbar.rightItem.onTab { [self] in
            if (presenter?.countCity() ?? 0) > 0 {
                router?.new(MainBuilder.create())
            } else {
                let alert = UIAlertController(title: "Attention", message: "No cities selected", preferredStyle: UIAlertController.Style.alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                present(alert, animated: true, completion: nil)
            }
        }
        
        citiesWeatherList.onSelect { [self] model in
            router?.new(MainBuilder.create(selectCity: model))
        }
        
        citiesWeatherList.onDelete { [self] model in
            presenter?.remove(model)
        }
    }
    
    override func setupSubViews() {
        view.addSubview(toolbar)
        toolbar.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(40)
        }
        
        view.addSubview(citiesWeatherList)
        citiesWeatherList.snp.makeConstraints { make in
            make.top.equalTo(toolbar.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.showSave()
    }
}

extension CitiesEditController: CitiesEditDelegate {
    func showSaveCitys(models: [SearchModel]) {
        citiesWeatherList.fill(models)
    }
}
