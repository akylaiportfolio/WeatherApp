//
//  UITableView + Ext.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 27/2/24.
//

import UIKit

extension UITableView {
    
    func register(_ type: AnyClass) {
        register(type, forCellReuseIdentifier: String(describing: type))
    }
    
    func dequeueCell<T>(_ type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: type), for: indexPath) as! T
    }
}
