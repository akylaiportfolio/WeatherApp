//
//  PopularCitiesCell.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 27/2/24.
//

import UIKit
import SnapKit

class PopularCitiesCell: BaseCollectionViewCell {
    
    private lazy var city: BaseLabel = {
        let view = BaseLabel()
        view.font = .systemFont(ofSize: 16, weight: .medium)
        view.textColor = .init(hex: "#6C6C6C")
        return view
    }()
    
    override func setupView() {
        backgroundColor = .init(hex: "#DEE5F2")
        layer.cornerRadius = 35 / 2
    }
    
    override func setupSubViews() {
        addSubview(city)
        city.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private var model: SearchModel? = nil
    
    func fill(_ model: SearchModel) {
        self.model = model
        
        city.text = model.name
    }
    
    func onTap(action: @escaping (SearchModel) -> Void) {
        self.onTab { [self] in
            if let model = model {
                action(model)
            }
        }
    }
}
