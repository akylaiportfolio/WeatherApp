//
//  CityWeather.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 27/2/24.
//

import UIKit
import SnapKit

class CityWeather: BaseView {
    
    public lazy var cityName: BaseLabel = {
        let view = BaseLabel()
        view.font = .systemFont(ofSize: 48, weight: .bold)
        view.textColor = .init(hex: "#FFFFFF")
        return view
    }()
    
    public lazy var degreesContener = BaseView()
    
    public lazy var degreesCount: BaseLabel = {
        let view = BaseLabel()
        view.text = "  "
        view.textColor = .init(hex: "#FFFFFF")
        view.font = .systemFont(ofSize: 100, weight: .semibold)
        return view
    }()
    
    public lazy var degreeImage = BaseImage(image: UIImage(named: "MainDegree"))
    
    public lazy var date: BaseLabel = {
        let view = BaseLabel()
        view.text = "---- | -- | --"
        view.font = .systemFont(ofSize: 16.67, weight: .semibold)
        view.textColor = .init(hex: "#FFFFFF")
        return view
    }()
    
    private lazy var progress: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .large
        view.color = .white
        return view
    }()

    override func setupSubViews() {
        addSubview(cityName)
        cityName.snp.makeConstraints { make in
            make.top.centerX.equalToSuperview()
        }
        
        addSubview(degreesContener)
        degreesContener.snp.makeConstraints { make in
            make.top.equalTo(cityName.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        degreesContener.addSubview(degreesCount)
        degreesCount.snp.makeConstraints { make in
            make.top.bottom.left.equalToSuperview()
        }
        
        degreesContener.addSubview(degreeImage)
        degreeImage.snp.makeConstraints { make in
            make.top.right.equalToSuperview()

            make.left.equalTo(degreesCount.snp.right).offset(2)
            
            make.height.equalTo(47)
            make.width.equalTo(36)
        }
        
        addSubview(date)
        date.snp.makeConstraints { make in
            make.top.equalTo(degreesContener.snp.bottom)
            make.centerX.bottom.equalToSuperview()
        }
        
        addSubview(progress)
        progress.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
        }
        
        progress.startAnimating()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
              
        if model == nil {
            progress.startAnimating()
        } else {
            progress.stopAnimating()
            progress.isHidden = true
        }
    }
    
    private var model: WeatherModel? = nil
    
    func fill(_ model: WeatherModel) {
        progress.stopAnimating()
        progress.isHidden = true
        
        self.model = model
        
        if let item = model.list.first {
            degreesCount.text = String(Int(round(item.main.temp - 273)))
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "yyyy.MM.dd"
            
            if let date = dateFormatter.date(from: item.dtTxt) {
                self.date.text = timeFormatter.string(from: date)
            }
        }
    }
}
