//
//  SearchToolbar.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 27/2/24.
//

import UIKit
import SnapKit

class SearchToolbar: BaseView {
    
    public lazy var backItem = BaseImage(image: UIImage(named: "BackItem"))
    
    private lazy var title: BaseLabel = {
        let view = BaseLabel()
        view.text = "Search for City"
        view.font = .systemFont(ofSize: 28, weight: .bold)
        view.textColor = .init(hex: "#FFFFFF")
        return view
    }()
    
    override func setupSubViews() {
        addSubview(backItem)
        backItem.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        addSubview(title)
        title.snp.makeConstraints { make in
            make.leading.equalTo(backItem.snp.trailing).offset(16)
            make.top.bottom.equalToSuperview()
        }
    }
}
