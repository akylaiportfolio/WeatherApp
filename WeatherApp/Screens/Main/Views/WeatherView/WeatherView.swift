//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Акылай Бекболсунова on 28/2/24.
//

import UIKit
import SnapKit

class WeatherView: BaseView {
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        view.isPagingEnabled = true
        view.delegate = self
        view.dataSource = self
        
        view.backgroundColor = .clear
        view.showsHorizontalScrollIndicator = false
        
        view.register(WeatherCell.self)
        
        return view
    }()
    
    private var models: [SearchModel] = []
    
    private var pageCallBack: ((Int) -> Void)? = nil
    
    override func setupSubViews() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func fill(models: [SearchModel]) {
        self.models = models
        
        collectionView.reloadData()
    }
    
    func setPage(_ index: Int) {
        DispatchQueue.main.async { [self] in
            collectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .top, animated: false)
        }
    }
    
    func changePage(action: @escaping (Int) -> Void) {
        self.pageCallBack = action
    }
}

extension WeatherView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1)
        
        print(pageWidth)
        print(scrollView.contentOffset.x)
        print(page)
        
        pageCallBack?(page)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(WeatherCell.self, for: indexPath)
        let model = models[indexPath.row]
        
        cell.fill(model: model, index: indexPath)
        
        return cell
    }
}
