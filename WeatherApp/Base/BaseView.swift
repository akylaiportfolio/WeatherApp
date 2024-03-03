//
//  BaseView.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 27/2/24.
//

import UIKit

class BaseView: UIView {
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var isCreate = false
    
    override func layoutSubviews() {
        if !isCreate {
            isCreate = true
            
            setupView()
            
            setupSubViews()
        }
    }
    
    func setupView() {
        
    }
    
    func setupSubViews() {
        
    }
    
    private var action: () -> Void = {}
    
    public func onTab(action: @escaping () -> Void) {
        self.action = action
        
        isUserInteractionEnabled = true
        
        let tab = UITapGestureRecognizer(target: self, action: #selector(onClick))
        addGestureRecognizer(tab)
    }
    
    @objc func onClick() {
        action()
    }
}

