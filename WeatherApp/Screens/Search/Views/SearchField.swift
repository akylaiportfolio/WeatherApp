//
//  SearchField.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 27/2/24.
//

import UIKit
import SnapKit

class SearchField: BaseView {
    
    private lazy var searchIcon = BaseImage(image: UIImage(named: "Search"))
    
    lazy var textField: BaseTextField = {
        let view = BaseTextField()
        view.placeholder = "Search for a city..."
        view.font = .systemFont(ofSize: 16, weight: .semibold)
        view.textColor = .init(hex: "#8C8C8C")
        return view
    }()
    
    override func setupView() {
        backgroundColor = .init(hex: "#FFFFFF")
        layer.cornerRadius = 48 / 2
        
        snp.makeConstraints { make in
            make.height.equalTo(48)
        }
    }
    
    override func setupSubViews() {
        addSubview(searchIcon)
        searchIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        }
        
        addSubview(textField)
        textField.snp.makeConstraints { make in
            make.leading.equalTo(searchIcon.snp.trailing).offset(16)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}
