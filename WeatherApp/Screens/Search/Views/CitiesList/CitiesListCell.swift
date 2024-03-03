//
//  CitiesListCell.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 27/2/24.
//

import UIKit
import SnapKit

class CitiesListCell: BaseTableViewCell {
    
    private lazy var city: BaseLabel = {
        let view = BaseLabel()
        view.textColor = .init(hex: "#FFFFFF")
        view.font = .systemFont(ofSize: 18, weight: .regular)
        return view
    }()
    
    private lazy var addIcon = BaseImage(image: UIImage(named: "AddIcon"))
    
    private lazy var separatorLine: BaseView = {
        let view = BaseView()
        view.backgroundColor = .init(hex: "#4DFFFFFF")
        return view
    }()
    
    override func setupSubViews() {
        addSubview(city)
        city.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        addSubview(addIcon)
        addIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        addSubview(separatorLine)
        separatorLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
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
