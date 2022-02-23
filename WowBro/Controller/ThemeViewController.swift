//
//  ThemeViewController.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/22.
//

import UIKit

class ThemeViewController: UIViewController {
    @IBOutlet weak var themeImageView: UIImageView!
    @IBOutlet weak var themeListTableView: UITableView!
    
    var tourList: [Tour] = [Tour(tourName: "펭귄마을", address: "광주 남구 천변좌로 446번길 7", tourPhotoUrl: "ㅉㅈ", tourDetail: TourDetail(isGood: false, webViewUrl: "https://m.place.naver.com/place/37615287/home?entry=pll", qrCode: "www", storyTitle: "안녕하세요", tourStory: "안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 "), isStamped: false), Tour(tourName: "공예거리", address: "광주 남구 오기원길 20-13", tourPhotoUrl: "ㅉㅈ", tourDetail: TourDetail(isGood: false, webViewUrl: "https://m.place.naver.com/place/1530716998/home?entry=pll", qrCode: "www", storyTitle: "공예거리입니다.", tourStory: "마마마ㅏ마마마마마마마마마마마ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ"), isStamped: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "S-Core Dream", size: 20)!, NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        themeImageView.layer.cornerRadius = 30
        themeListTableView.delegate = self
        themeListTableView.dataSource = self
        
        let nibName = UINib(nibName: "TourTableViewCell", bundle: nil)
        
        themeListTableView.register(nibName, forCellReuseIdentifier: "TourTableViewCell")
    }

}

extension ThemeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tourList.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TourTableViewCell", for: indexPath) as? TourTableViewCell else { return UITableViewCell() }
        cell.tourPhoto.image = UIImage(named: "test")
        cell.tourName.text = tourList[indexPath.row].tourName
        cell.tourAddress.text = tourList[indexPath.row].address
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController" ) as? DetailViewController else { return }
        
        detailViewController.tourDetail = tourList[indexPath.row].tourDetail
        detailViewController.name = tourList[indexPath.row].tourName
        self.show(detailViewController, sender: nil)
    }
}
