//
//  UIView + Ext.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 27/2/24.
//

import UIKit
import SnapKit

extension UIView {
    
    var safeArea: ConstraintBasicAttributesDSL {
        #if swift(>=3.2)
            if #available(iOS 11.0, *) {
                return self.safeAreaLayoutGuide.snp
            }
            return self.snp
        #else
            return self.snp
        #endif
    }
    
    func addGradient(start: UIColor, end: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds

        gradientLayer.colors = [start.cgColor, end.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)

        layer.insertSublayer(gradientLayer, at: 0)
    }
}
