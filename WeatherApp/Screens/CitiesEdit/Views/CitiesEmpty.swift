//
//  File.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 1/3/24.
//

import UIKit
import SnapKit

class CitiesEmpty: BaseView {
    
    private lazy var addCityLabel: BaseLabel = {
        let view = BaseLabel()
        view.text = "Please add Your city"
        view.textAlignment = .center
        view.textColor = .init(hex: "#FFFFFF")
        view.font = .systemFont(ofSize: 20, weight: .semibold)
        view.numberOfLines = 0
        return view
    }()
    
    override func setupSubViews() {
        addSubview(addCityLabel)
        addCityLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(24)
        }
    }
}

// Bahram2024
