//
//  RouterController.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 29/2/24.
//

import UIKit
import SnapKit

class RouterController: UINavigationController {
    
    override func viewDidLoad() {
        setupNavigationBar()
        setupController()
    }
    
    private func setupController() {
        view.backgroundColor = .clear
    }
    
    private func setupNavigationBar() {
        navigationBar.backgroundColor = .clear
        
        navigationBar.isHidden = true
    }
    
    public func open(_ controller: BaseViewController) {
        pushViewController(controller, animated: true)
    }
    
    public func back() {
        popViewController(animated: true)
    }
    
    public func opens(_ controllers: [BaseViewController]) {
        setViewControllers(controllers, animated: true)
    }
    
    public func backTo<C: BaseViewController>(_ controller: C.Type) {
        if viewControllers.contains(where: { controller in controller is C }) {
            var controllers: [UIViewController] = []
            
            for screen in viewControllers {
                if screen is C {
                    controllers.append(screen)
                    
                    break
                }
                
                controllers.append(screen)
            }
            
            setViewControllers(controllers, animated: true)
        }
    }
    
    public func new(_ controller: BaseViewController) {
        setViewControllers([controller], animated: true)
    }
}
