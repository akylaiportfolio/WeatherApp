//
//  MainController.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 27/2/24.
//

import UIKit
import SnapKit

class MainController: BaseViewController {
    
    private lazy var backgroundImage = BaseImage()
    
    public var presenter: MainPresenter?
    
    private lazy var toolbar = MainToolbar()
    
    private lazy var weather = WeatherView()
    
    private lazy var pageIndicator = PageIndicator()
    
    override func setupController() {
        view.backgroundColor = .white
        
        backgroundImage.image = .redMain
                
        weather.changePage { [self] pageIndex in
            pageIndicator.set(index: pageIndex)
            
            if pageIndex % 3 == 0 {
                UIView.transition(with: backgroundImage, duration: 0.5, options: .curveEaseInOut) {
                    self.backgroundImage.image = .redMain
                }
            }
            
            if pageIndex % 3 == 1 {
                UIView.transition(with: backgroundImage, duration: 0.5, options: .curveEaseInOut) {
                    self.backgroundImage.image = .orengeMain
                }
            }
            
            if pageIndex % 3 == 2 {
                UIView.transition(with: backgroundImage, duration: 0.5, options: .curveEaseInOut) {
                    self.backgroundImage.image = .greenMain
                }
            }
        }
        
        toolbar.rightItem.onTab { [self] in
            router?.new(CitiesEditBuilder.create())
        }
        
        toolbar.leftItem.onTab { [self] in
            router?.open(SearchBuilder.create())
        }
        
        presenter?.showSave()
        
        presenter?.showPage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.showSave()
        
        pageIndicator.set(index: pageIndicator.currentIndex)
    }
    
    override func setupSubViews() {
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        view.addSubview(toolbar)
        toolbar.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(40)
        }
        
        view.addSubview(weather)
        weather.snp.makeConstraints { make in
            make.top.equalTo(toolbar.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeArea.bottom)
        }
        
        view.addSubview(pageIndicator)
        pageIndicator.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeArea.bottom).offset(-20)
            make.left.right.equalToSuperview()
            make.height.equalTo(16)
        }
    }
}

extension MainController: MainDelegate {
    func showSaveCitys(models: [SearchModel]) {
        weather.fill(models: models)
        
        if models.count > 1 {
            pageIndicator.fill(count: models.count)
        }
    }
    
    func showPage(index: Int) {
        weather.setPage(index)
    }
}
