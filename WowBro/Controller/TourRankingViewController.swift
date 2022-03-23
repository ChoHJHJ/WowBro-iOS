//
//  TourRankingViewController.swift
//  WowBro
//
//  Created by HyunJoong on 2022/03/23.
//

import UIKit
import SwiftyJSON
import Alamofire
import Kingfisher

class TourRankingViewController: UIViewController {
    @IBOutlet var tourRankingTableView: UITableView!
    var tourRankingInfo: [TourRanking] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        
    }

    func initView() {
        tourRankingTableView.delegate = self
        tourRankingTableView.dataSource = self
        tourRankingTableView.clipsToBounds = true
        
        let nibName = UINib(nibName: "TourRankingTableViewCell", bundle: nil)
        
        tourRankingTableView.register(nibName, forCellReuseIdentifier: "TourRankingTableViewCell")
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "S-Core Dream", size: 20)!, NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        
        let urlString = "http://192.168.0.9:3000/tourRanking"
        let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: encodedString)!
        let alamo = AF.request(url, method: .get)
        
        alamo.responseDecodable(of: [TourRanking].self) {[weak self] response in
            self?.tourRankingInfo = response.value ?? []
            self?.tourRankingTableView.reloadData()
        }
    }
}


extension TourRankingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tourRankingInfo.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TourRankingTableViewCell", for: indexPath) as? TourRankingTableViewCell else { return UITableViewCell() }
       
        cell.tourNameLabel.text = tourRankingInfo[indexPath.row].tourName
        cell.tourPopularityLabel.text = "Score: \(tourRankingInfo[indexPath.row].tourLike)"
        cell.tourRankingLabel.text = String(indexPath.row + 1)
        let url = URL(string: tourRankingInfo[indexPath.item].tourPhotoUrl)
        cell.tourPhoto?.kf.setImage(with: url)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
