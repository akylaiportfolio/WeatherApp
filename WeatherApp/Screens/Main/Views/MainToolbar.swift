//
//  MainToolbar.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 27/2/24.
//

import UIKit
import SnapKit

class MainToolbar: BaseView {
    
    public lazy var leftItem = BaseImage(image: UIImage(named: "AddItem"))
    
    public lazy var rightItem = BaseImage(image: UIImage(named: "MenuItem"))
    
    private lazy var container: BaseView = {
        let view = BaseView()
        view.backgroundColor = .init(hex: "#80FFFFFF")
        view.layer.cornerRadius = 24 / 2
        return view
    }()
    
    private lazy var location = BaseImage(image: UIImage(named: "Location"))
    
    private lazy var turnOn: BaseLabel = {
        let view = BaseLabel()
        view.text = "turn on location"
        view.font = .systemFont(ofSize: 16, weight: .semibold)
        view.textColor = .init(hex: "#FFFFFF")
        return view
    }()
    
    override func setupSubViews() {
        addSubview(leftItem)
        leftItem.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        addSubview(rightItem)
        rightItem.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        addSubview(container)
        container.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(24)
        }
        
        container.addSubview(location)
        location.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(11)
        }
        
        container.addSubview(turnOn)
        turnOn.snp.makeConstraints { make in
            make.leading.equalTo(location.snp.trailing).offset(4)
            make.trailing.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
        }
    }
}
