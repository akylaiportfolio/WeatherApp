//
//  BaseImage.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 27/2/24.
//

import UIKit

class BaseImage: UIImageView {
    
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

