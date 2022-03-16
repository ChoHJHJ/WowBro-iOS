//
//  MainViewController.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/22.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController {
    @IBOutlet var headerView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!
    
    var currentId: String?
    
    let recommendTourList = [RecommenedTour(recommendTourName: "송정역시장", recommendTourImageUrl: "songjeong", recommendTourWebViewUrl: "https://m.place.naver.com/place/37823477/home?entry=plt"), RecommenedTour(recommendTourName: "운암도서관", recommendTourImageUrl: "library", recommendTourWebViewUrl: "https://lib.bukgu.gwangju.kr/main.do")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        collectionView!.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 30)
        
        let preferences = UserDefaults.standard

        if preferences.object(forKey: "insertedId") == nil {
            print("Doesn't exist!")
        } else {
            currentId = preferences.string(forKey: "insertedId")
        }
        print(currentId!)
    }
    
    func initView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        collectionView = UICollectionView(frame: collectionView.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.clipsToBounds = true
        
        
        let nibName = UINib(nibName: "ImageCell", bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: "ImageCell")
        collectionView.backgroundColor = UIColor(named: "blue")
        
        let tableNibName = UINib(nibName: "RecommendTourCell", bundle: nil)
        tableView.register(tableNibName, forCellReuseIdentifier: "RecommendTourCell")
        
        self.view.addSubview(collectionView)
    }
}

extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return themeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let themeViewController = storyboard.instantiateViewController(withIdentifier: "ThemeViewController" ) as? ThemeViewController else { return }
        themeViewController.tourName = themeList[indexPath.item].themeName
        self.show(themeViewController, sender: nil)
    }
}


extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        let url = URL(string: themeList[indexPath.item].themeUrlString)
        cell.themeImageView?.kf.setImage(with: url)
        cell.themeLabel?.text = themeList[indexPath.item].themeName + " 이야기"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 200, height: 200)
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recommendTourList.count
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendTourCell", for: indexPath) as? RecommendTourCell else { return UITableViewCell() }
        cell.RecommendTourName.text = recommendTourList[indexPath.row].recommendTourName
        cell.RecommendTourImageView.image = UIImage(named: recommendTourList[indexPath.row].recommendTourImageUrl)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let webInfoViewController = storyboard.instantiateViewController(withIdentifier: "WebInfoViewController" ) as? WebInfoViewController else { return }
        
        webInfoViewController.tourUrl = recommendTourList[indexPath.row].recommendTourWebViewUrl
        self.show(webInfoViewController, sender: nil)
    }
}
