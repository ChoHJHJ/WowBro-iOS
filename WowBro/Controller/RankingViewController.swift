//
//  RankingViewController.swift
//  WowBro
//
//  Created by HyunJoong on 2022/03/01.
//

import UIKit
import SwiftyJSON
import Alamofire

class RankingViewController: UIViewController {
    
    @IBOutlet var rankingTableView: UITableView!
    var rankingInfo: [Ranking] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        
    }
    
    func initView() {
        rankingTableView.delegate = self
        rankingTableView.dataSource = self
        rankingTableView.clipsToBounds = true
        
        let nibName = UINib(nibName: "RankingTableViewCell", bundle: nil)
        
        rankingTableView.register(nibName, forCellReuseIdentifier: "RankingTableViewCell")
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "S-Core Dream", size: 20)!, NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        
        let urlString = "http://192.168.0.9:3000/ranking"
        let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: encodedString)!
        let alamo = AF.request(url, method: .get)
        
        alamo.responseDecodable(of: [Ranking].self) {[weak self] response in
            self?.rankingInfo = response.value ?? []
            self?.rankingTableView.reloadData()
            
        }
    }
}

extension RankingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankingInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RankingTableViewCell", for: indexPath) as? RankingTableViewCell else { return UITableViewCell() }
       
        cell.userNameLabel.text = rankingInfo[indexPath.row].userID
        cell.qrScore.text = "Score: \(rankingInfo[indexPath.row].qrCount)"
        cell.rankingLabel.text = String(indexPath.row + 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
