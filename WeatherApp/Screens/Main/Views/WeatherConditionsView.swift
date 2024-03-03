//
//  WeatherConditions.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 28/2/24.
//

import UIKit
import SnapKit

class WeatherConditionsView: BaseView {
    
    class WeatherConditionsItems: BaseView {
        
        private lazy var titleIcon = BaseImage()
        
        private lazy var titleLabel: BaseLabel = {
            let view = BaseLabel()
            view.textColor = .init(hex: "#FFFFFF")
            view.font = .systemFont(ofSize: 14, weight: .semibold)
            return view
        }()
        
        private lazy var titleContener = BaseView()
        
        public lazy var valueLabel: BaseLabel = {
            let view = BaseLabel()
            view.textColor = .init(hex: "#FFFFFF")
            view.font = .systemFont(ofSize: 24, weight: .semibold)
            return view
        }()
        
        private lazy var leftSeparator: BaseView = {
            let view = BaseView()
            view.backgroundColor = UIColor(hex: "#80FFFFFF")
            return view
        }()
        
        private lazy var rightSeparator: BaseView = {
            let view = BaseView()
            view.backgroundColor = UIColor(hex: "#80FFFFFF")
            return view
        }()
        
        init(title: String, image: UIImage, value: String, separatorHidden: Bool = true) {
            super.init()
            
            self.titleLabel.text = title
            self.titleIcon.image = image
            self.valueLabel.text = value
            
            self.leftSeparator.isHidden = separatorHidden
            self.rightSeparator.isHidden = separatorHidden
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func setupSubViews() {
            addSubview(leftSeparator)
            leftSeparator.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(28)
                make.bottom.equalToSuperview().offset(-28)
                make.left.equalToSuperview().offset(-0.5)
                make.width.equalTo(1)
            }
            
            addSubview(rightSeparator)
            rightSeparator.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(28)
                make.bottom.equalToSuperview().offset(-28)
                make.right.equalToSuperview().offset(0.5)
                make.width.equalTo(1)
            }
            
            addSubview(titleContener)
            titleContener.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().offset(28)
            }
            
            titleContener.addSubview(titleIcon)
            titleIcon.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview()
                
                make.top.bottom.equalToSuperview()
            }
            
            titleContener.addSubview(titleLabel)
            titleLabel.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                
                make.left.equalTo(titleIcon.snp.right).offset(4)
                make.right.equalToSuperview()
            }
            
            addSubview(valueLabel)
            valueLabel.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().offset(-28)
            }
        }
    }
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    override func setupView() {
        layer.cornerRadius = 20
        layer.borderWidth = 12
        layer.borderColor = UIColor(hex: "#80FFFFFF").cgColor
    }
    
    private lazy var uv = WeatherConditionsItems(
        title: "UV Index", image: .UV, value: ""
    )
    
    private lazy var wind = WeatherConditionsItems(
        title: "Wind", image: .wind, value: ""
    )
    
    private lazy var humidity = WeatherConditionsItems(
        title: "Humidity", image: .humidity, value: ""
    )
    
    override func setupSubViews() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(12)
        }
        
        stackView.addArrangedSubview(uv)
        
        stackView.addArrangedSubview(wind)
        
        stackView.addArrangedSubview(humidity)
    }
    
    private var model: WeatherModel? = nil
    
    func fill(_ model: WeatherModel) {
        self.model = model
        
        if let item = model.list.first {
            uv.valueLabel.text = "0"
            
            wind.valueLabel.text = String(item.wind.speed) + " m/s"
            
            humidity.valueLabel.text = String(item.main.humidity) + "%"
        }
    }
}
