//
//  BaseTextField.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 2/3/24.
//

import UIKit

class BaseTextField: UITextField {
    
    private var timer: Timer? = nil
    
    private var changeEvent: ((String?) -> Void)? = nil
    
    init() {
        super.init(frame: .zero)
        
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private var time: TimeInterval? = nil
    
    func change(time: TimeInterval? = nil, action: @escaping (String?) -> Void) {
        self.time = time
        
        self.changeEvent = action
    }
}

extension BaseTextField: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let time = time {
            timer?.invalidate()

            timer = Timer.scheduledTimer(withTimeInterval: time, repeats: false) { timer in
                self.changeEvent?(textField.text)
            }
        } else {
            changeEvent?(textField.text)
        }
    }
}
