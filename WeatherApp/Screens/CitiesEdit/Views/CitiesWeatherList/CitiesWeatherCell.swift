//
//  CitiesWeatherCell.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 27/2/24.
//

import UIKit
import SnapKit

class CitiesWeatherCell: BaseTableViewCell {
    
    private lazy var container = BaseView()
    
    private lazy var delete = BaseImage(image: UIImage(named: "Delete"))
    
    private lazy var degreesCount: BaseLabel = {
        let view = BaseLabel()
        view.text = "--"
        view.textColor = .init(hex: "#FFFFFF")
        view.font = .systemFont(ofSize: 60, weight: .semibold)
        return view
    }()
    
    private lazy var degreeImage = BaseImage(image: UIImage(named: "Degree"))
    
    private lazy var cityName: BaseLabel = {
        let view = BaseLabel()
        view.font = .systemFont(ofSize: 32, weight: .semibold)
        view.textColor = .init(hex: "#FFFFFF")
        return view
    }()
    
    private lazy var time: BaseLabel = {
        let view = BaseLabel()
        view.text = "-- : --"
        view.font = .systemFont(ofSize: 16, weight: .light)
        view.textColor = .init(hex: "#E4E4E4")
        return view
    }()
    
    private lazy var weatherImage = BaseImage()
    
    private lazy var progress: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .large
        view.startAnimating()
        return view
    }()
    
    private lazy var weatherСondition: BaseLabel = {
        let view = BaseLabel()
        view.text = ""
        view.font = .systemFont(ofSize: 18, weight: .regular)
        view.textColor = .init(hex: "#E4E4E4")
        return view
    }()
    
    private lazy var separatorLine: BaseView = {
        let view = BaseView()
        view.backgroundColor = .init(hex: "#4DFFFFFF")
        return view
    }()
    
    private var data = true
    
    override func setupSubViews() {
        addSubview(container)
        container.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().offset(-8)
        }
        
        container.addSubview(delete)
        delete.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview()
        }
        
        container.addSubview(degreesCount)
        degreesCount.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(23)
            make.leading.equalToSuperview().offset(16)
        }
        
        container.addSubview(degreeImage)
        degreeImage.snp.makeConstraints { make in
            make.leading.equalTo(degreesCount.snp.trailing).offset(8)
            make.top.equalTo(degreesCount.snp.top)
        }
        
        container.addSubview(cityName)
        cityName.snp.makeConstraints { make in
            make.top.equalTo(degreesCount.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(16)
        }
        
        container.addSubview(time)
        time.snp.makeConstraints { make in
            make.top.equalTo(cityName.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(16)
        }
        
        container.addSubview(weatherImage)
        weatherImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(29.5)
            make.trailing.equalToSuperview().offset(-28)
        }
        
        container.addSubview(weatherСondition)
        weatherСondition.snp.makeConstraints { make in
            make.top.equalTo(weatherImage.snp.bottom).offset(10)
            make.centerX.equalTo(weatherImage)
        }
        
        container.addSubview(progress)
        progress.snp.makeConstraints { make in
            make.centerY.equalToSuperview()

            make.width.height.equalTo(40)
            
            make.trailing.equalToSuperview().inset(75)
        }
        
        container.addSubview(separatorLine)
        separatorLine.snp.makeConstraints { make in
            make.top.equalTo(time.snp.bottom).offset(22)
            make.height.equalTo(1.5)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private var model: SearchModel? = nil
    
    func fill(_ model: SearchModel) {
        self.model = model
        
        cityName.text = model.name
        
        if data {
            data = false
            
            progress.startAnimating()
            
            ApiClient.shered.weather(model) { [self] result in
                switch result {
                case .success(let model):
                    if let item = model.list.first {
                        progress.stopAnimating()
                        
                        progress.isHidden = true
                        
                        fillResult(item)
                    }
                    
                    break
                case .failure(let failure):
                    dump(failure)
                    
                    break
                }
            }
        }
    }
    
    private func fillResult(_ item: List) {
        weatherСondition.text = item.weather.first?.description
        
        weatherImage.image = UIImage(named: "PartlyCloudyImage")
        
        degreesCount.text = String(Int(round(item.main.temp - 273)))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH : mm"
        
        if let date = dateFormatter.date(from: item.dtTxt) {
            time.text = timeFormatter.string(from: date) + " PM"
        }
    }
    
    func onTabDelate(action: @escaping (SearchModel) -> Void) {
        delete.onTab { [self] in
            if let model = model {
                action(model)
            }
        }
    }
    
    func onTap(action: @escaping (SearchModel) -> Void) {
        container.onTab { [self] in
            if let model = model {
                action(model)
            }
        }
    }
}
