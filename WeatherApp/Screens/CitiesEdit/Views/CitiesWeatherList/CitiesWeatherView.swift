//
//  CitiesWeatherView.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 27/2/24.
//

import UIKit
import SnapKit

class CitiesWeatherView: BaseView {
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        
        view.register(CitiesWeatherCell.self)
        
        view.delegate = self
        view.dataSource = self
        
        view.separatorStyle = .none
        
        return view
    }()
    
    private var models: [SearchModel] = []
    
    private var action: ((SearchModel) -> Void)? = nil
    
    private var delete: ((SearchModel) -> Void)? = nil
    
    override func setupSubViews() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func fill(_ models: [SearchModel]) {
        self.models = models
        
        tableView.reloadData()
    }
    
    func onSelect(action: @escaping (SearchModel) -> Void) {
        self.action = action
    }
    
    func onDelete(action: @escaping (SearchModel) -> Void) {
        self.delete = action
    }
}

extension CitiesWeatherView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(CitiesWeatherCell.self, for: indexPath)
        let model = models[indexPath.row]
        
        cell.fill(model)
        
        cell.onTap { model in
            self.action?(model)
        }
        
        cell.onTabDelate { model in
            self.delete?(model)
        }
        
        return cell
    }
}

