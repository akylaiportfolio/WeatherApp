//
//  HourlyForecastView.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 28/2/24.
//

import UIKit
import SnapKit

class HourlyForecastView: BaseView {
    
    class HourlyForecastItems: BaseView {
        
        private lazy var time: BaseLabel = {
            let view = BaseLabel()
            view.font = .systemFont(ofSize: 14, weight: .light)
            view.textColor = .init(hex: "#FFFFFF")
            return view
        }()
        
        private lazy var degreesCount: BaseLabel = {
            let view = BaseLabel()
            view.font = .systemFont(ofSize: 20, weight: .semibold)
            view.textColor = .init(hex: "#FFFFFF")
            return view
        }()
        
        private lazy var degreeSign = BaseImage(image: UIImage(named: "HourDegree"))
        
        private lazy var weatherImage = BaseImage(image: UIImage(named: "HourWeatherImage"))
        
        init(item: List) {
            super.init()
                        
            degreesCount.text = String(Int(round(item.main.temp - 273)))
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "HH:mm"
            
            if let date = dateFormatter.date(from: item.dtTxt) {
                self.time.text = timeFormatter.string(from: date)
            }
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func setupSubViews() {
            addSubview(time)
            time.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(15)
                make.centerX.equalToSuperview()
            }
            
            addSubview(degreesCount)
            degreesCount.snp.makeConstraints { make in
                make.top.equalTo(time.snp.bottom).offset(8)
                make.centerX.equalToSuperview()
            }
            
            addSubview(degreeSign)
            degreeSign.snp.makeConstraints { make in
                make.leading.equalTo(degreesCount.snp.trailing).offset(4)
                make.top.equalTo(degreesCount.snp.top)
            }
            
            addSubview(weatherImage)
            weatherImage.snp.makeConstraints { make in
                make.top.equalTo(degreesCount.snp.bottom).offset(8)
                make.centerX.equalToSuperview()
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
    
    override func setupSubViews() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(12)
            make.leading.trailing.equalToSuperview().inset(12)
        }
    }
    
    private var model: WeatherModel? = nil
    
    func fill(_ model: WeatherModel) {
        self.model = model
        
        model.list.enumerated().forEach { (index, item) in
            if index == 1 {
                stackView.addArrangedSubview(HourlyForecastItems(item: item))
            }
            
            if index == 2 {
                stackView.addArrangedSubview(HourlyForecastItems(item: item))
            }
            
            if index == 3 {
                stackView.addArrangedSubview(HourlyForecastItems(item: item))
            }
            
            if index == 4 {
                stackView.addArrangedSubview(HourlyForecastItems(item: item))
            }
            
            if index == 5 {
                stackView.addArrangedSubview(HourlyForecastItems(item: item))
            }
        }
    }
}
