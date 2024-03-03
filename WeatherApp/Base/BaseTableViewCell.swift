//
//  BaseTableViewCell.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 27/2/24.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    private var action: () -> Void = {}
    
    public func onTab(action: @escaping () -> Void) {
        self.action = action
        
        isUserInteractionEnabled = true
        
        let tab = UITapGestureRecognizer(target: self, action: #selector(onClick))
        contentView.addGestureRecognizer(tab)
    }
    
    @objc func onClick() {
        action()
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
}
