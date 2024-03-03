//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 27/2/24.
//

import UIKit
import SnapKit

class WeatherCell: BaseCollectionViewCell {
    
    private lazy var cityWeather = CityWeather()
    
    private lazy var weatherConditions = WeatherConditionsView()
    
    private lazy var hourlyForecast = HourlyForecastView()
    
    override func setupSubViews() {
        addSubview(cityWeather)
        cityWeather.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(UIScreen.main.bounds.height / 10)
            make.centerX.width.equalToSuperview()
        }
        
        addSubview(hourlyForecast)
        hourlyForecast.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-60)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(136)
        }
        
        addSubview(weatherConditions)
        weatherConditions.snp.makeConstraints { make in
            make.bottom.equalTo(hourlyForecast.snp.top).offset(12)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(136)
        }
    }
    
    private var data = true
    
    func fill(model: SearchModel, index: IndexPath) {
        cityWeather.cityName.text = model.name
        
        if index.row % 3 == 0 {
            weatherConditions.backgroundColor = .init(hex: "#E0746F")
            hourlyForecast.backgroundColor = .init(hex: "#E0746F")
        }
        
        if index.row % 3 == 1 {
            weatherConditions.backgroundColor = .init(hex: "#F3733C")
            hourlyForecast.backgroundColor = .init(hex: "#F3733C")
        }
        
        if index.row % 3 == 2 {
            weatherConditions.backgroundColor = .init(hex: "#5FCD7E")
            hourlyForecast.backgroundColor = .init(hex: "#5FCD7E")
        }
        
        if data {
            data = false
            
            ApiClient.shered.weather(model) { [self] result in
                switch result {
                case .success(let model):
                    cityWeather.fill(model)
                    weatherConditions.fill(model)
                    hourlyForecast.fill(model)

                    break
                case .failure(let failure):
                    dump(failure)
                    
                    break
                }
            }
        }
    }
}
