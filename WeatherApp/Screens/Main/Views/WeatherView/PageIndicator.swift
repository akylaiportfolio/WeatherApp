//
//  PageIndicator.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 29/2/24.
//

import UIKit
import SnapKit

class PageIndicator: BaseView {
    
    private var stack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 6
        return view
    }()
    
    private var items: [PageItem] = []
    
    override func setupView() {
        snp.makeConstraints { make in
            make.height.equalTo(16)
        }
        
        set(index: 0)
    }
    
    override func setupSubViews() {
        addSubview(stack)
        stack.snp.makeConstraints { make in
            make.centerX.top.bottom.equalToSuperview()
        }
    }
    
    func fill(count: Int) {
        stack.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
        
        items.removeAll()
        
        for _ in 0 ..< count {
            let item = PageItem()
            
            stack.addArrangedSubview(item)
            
            self.items.append(item)
        }
    }
    
    public var currentIndex = 0
    
    func set(index: Int) {
        if items.count > 1 {
            DispatchQueue.main.async { [self] in
                items.forEach { item in
                    item.setupDisaple()
                }
                
                if items.count > index {
                    items[index].setupActive()
                }
                
                currentIndex = index
            }
        }
    }
}

class PageItem: BaseView {
    
    override func setupView() {
        backgroundColor = .init(hex: "#80FFFFFF")
        layer.cornerRadius = 8
        
        snp.makeConstraints { make in
            make.height.width.equalTo(16)
        }
    }
    
    func setupActive() {
        backgroundColor = .init(hex: "#FFFFFF")
        
        snp.remakeConstraints { make in
            make.height.equalTo(16)
            
            make.width.equalTo(30)
        }
        
        UIView.animate(withDuration: 0.1) {
            self.layoutIfNeeded()
        }
    }
    
    func setupDisaple() {
        backgroundColor = .init(hex: "#80FFFFFF")
        
        snp.remakeConstraints { make in
            make.height.width.equalTo(16)
        }
        
        UIView.animate(withDuration: 0.1) {
            self.layoutIfNeeded()
        }
    }
}
