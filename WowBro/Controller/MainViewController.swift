//
//  MainViewController.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/22.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var headerView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    
    let imageArray = [UIImage(named: "test"),UIImage(named: "test"),UIImage(named: "test"), UIImage(named: "test")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        collectionView!.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 30)
    }
    
    func initView() {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 50, height: 50)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumLineSpacing = 30
        collectionView = UICollectionView(frame: collectionView.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        let nibName = UINib(nibName: "ImageCell", bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: "ImageCell")
        collectionView.backgroundColor = UIColor(named: "blue")
        
        self.view.addSubview(collectionView)
    }
}

extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let themeViewController = storyboard.instantiateViewController(withIdentifier: "ThemeViewController" ) as? ThemeViewController else { return }
        
        self.show(themeViewController, sender: nil)
    }
}


extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.themeImageView?.image = imageArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 100, height: 100)
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}
