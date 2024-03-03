//
//  UICollectionView + Ext.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 27/2/24.
//

import UIKit

extension UICollectionView {
    
    func register(_ type: AnyClass) {
        register(type, forCellWithReuseIdentifier: String(describing: type))
    }
    
    func dequeueCell<T>(_ type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: String(describing: type), for: indexPath) as! T
    }
}
