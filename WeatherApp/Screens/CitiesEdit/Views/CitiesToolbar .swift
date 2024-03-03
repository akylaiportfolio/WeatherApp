//
//  CitiesToolbar .swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 27/2/24.
//

import UIKit
import SnapKit

class CitiesToolbar: BaseView {
    
    public lazy var leftItem = BaseImage(image: UIImage(named: "AddItem"))
    
    public lazy var rightItem = BaseImage(image: UIImage(named: "MenuItem"))
    
    private lazy var title: BaseLabel = {
        let view = BaseLabel()
        view.text = "Regional Weather"
        view.font = .systemFont(ofSize: 28, weight: .bold)
        view.textColor = .init(hex: "#FFFFFF")
        return view
    }()
    
    override func setupSubViews() {
        addSubview(leftItem)
        leftItem.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        addSubview(rightItem)
        rightItem.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        addSubview(title)
        title.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
    }
}
