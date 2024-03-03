//
//  CitiesListView.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 27/2/24.
//

import UIKit
import SnapKit

class CitiesListView: BaseView {
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        
        view.register(CitiesListCell.self)
        
        view.delegate = self
        view.dataSource = self
        
        return view
    }()
    
    private var models: [SearchModel] = []
    
    private var action: ((SearchModel) -> Void)? = nil
    
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
    
    func select(action: @escaping (SearchModel) -> Void) {
        self.action = action
    }
}

extension CitiesListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(CitiesListCell.self, for: indexPath)
        let model = models[indexPath.row]
        
        cell.fill(model)
        
        cell.onTap { model in
            self.action?(model)
        }
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        superview?.endEditing(true)
    }
}
