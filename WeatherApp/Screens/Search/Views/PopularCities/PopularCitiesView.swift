//
//  PopularCitiesView.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 27/2/24.
//

import UIKit
import SnapKit

class PopularCitiesView: BaseView {
    
    private lazy var title: BaseLabel = {
        let view = BaseLabel()
        view.text = "Popular Cities"
        view.textColor = .init(hex: "#FFFFFF")
        view.font = .systemFont(ofSize: 14, weight: .regular)
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        
        view.dataSource = self
        view.delegate = self
        
        view.register(PopularCitiesCell.self)
        
        return view
    }()
    
    private var models: [SearchModel] = []
    
    private var action: ((SearchModel) -> Void)? = nil
    
    override func setupSubViews() {
        addSubview(title)
        title.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
        }
        
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func fill(_ models: [SearchModel]) {
        self.models = models
        
        collectionView.reloadData()
    }
    
    func select(action: @escaping (SearchModel) -> Void) {
        self.action = action
    }
}

extension PopularCitiesView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 82, height: 35)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        superview?.endEditing(true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(PopularCitiesCell.self, for: indexPath)
        let model = models[indexPath.row]
        
        cell.fill(model)
        
        cell.onTap { model in
            self.action?(model)
        }
        
        return cell
    }
}
