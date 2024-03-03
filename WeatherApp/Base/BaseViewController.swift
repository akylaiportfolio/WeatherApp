//
//  BaseViewController.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 27/2/24.
//

import UIKit

class BaseViewController: UIViewController {
    
    public lazy var router: RouterController? = {
        return navigationController as? RouterController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupController()
        setupSubViews()
    }
    
    func setupSubViews() {
        
    }
    
    func setupController() {
        
    }
}
