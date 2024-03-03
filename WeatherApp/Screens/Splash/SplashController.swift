//
//  SplashController.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 29/2/24.
//

import Foundation

class SplashController: BaseViewController {
    
    public var presenter: SplashPresenter?
    
    private lazy var welcomeLabel: BaseLabel = {
        let view = BaseLabel()
        view.text = "Welcome to WeatherApp"
        view.textAlignment = .center
        view.textColor = .init(hex: "#FFFFFF")
        view.font = .systemFont(ofSize: 20, weight: .semibold)
        view.numberOfLines = 0
        return view
    }()
    
    override func setupController() {
        view.addGradient(
            start: .init(hex: "#7EA9E9"),
            end: .init(hex: "#131C6C")
        )
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            self.presenter?.checkNavigate()
        }
    }
    
    override func setupSubViews() {
        view.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(24)
        }
    }
}

extension SplashController: SplashDelegate {
    func navigateToMain() {
        router?.new(MainBuilder.create())
    }
    
    func navigateToCities() {
        router?.opens(
            [CitiesEditBuilder.create(), SearchBuilder.create()]
        )
    }
}
